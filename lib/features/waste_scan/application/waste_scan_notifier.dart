import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/network/idempotency.dart';
import '../data/waste_scan_models.dart';
import '../data/waste_scan_repository.dart';
import '../ml/detection.dart';
import '../ml/matching_logic.dart';
import '../ml/mock_detector.dart';

part 'waste_scan_notifier.freezed.dart';

const _idempotencyActionKey = 'waste_scan_submit';

@freezed
abstract class WasteScanState with _$WasteScanState {
  const factory WasteScanState.idle() = _Idle;
  const factory WasteScanState.incomplete() = _Incomplete;
  const factory WasteScanState.previewMismatch({required WasteClass trashClass}) = _PreviewMismatch;
  const factory WasteScanState.previewMatch({
    required WasteClass trashClass,
    required double confidence,
  }) = _PreviewMatch;
  const factory WasteScanState.submitting() = _Submitting;
  const factory WasteScanState.success(WasteScanResult result) = _Success;
  const factory WasteScanState.error(String message) = _Error;
}

/// [Detector] seam — override provider ini dengan wrapper `ultralytics_yolo`
/// begitu `assets/model/best_int8.tflite` tersedia, tanpa ubah notifier/screen.
final detectorProvider = Provider<Detector>((ref) => MockDetector());

final wasteScanNotifierProvider =
    NotifierProvider<WasteScanNotifier, WasteScanState>(WasteScanNotifier.new);

class WasteScanNotifier extends Notifier<WasteScanState> {
  late final Detector _detector;
  late final WasteScanRepository _repo;
  late final IdempotencyKeyManager _idempotency;

  @override
  WasteScanState build() {
    _detector = ref.watch(detectorProvider);
    _repo = ref.watch(wasteScanRepositoryProvider);
    _idempotency = ref.watch(idempotencyKeyManagerProvider);
    return const WasteScanState.idle();
  }

  /// Hanya berefek kalau [_detector] sedang [MockDetector] (dev/QA sebelum
  /// model asli ada) — no-op kalau sudah pakai detector kamera sungguhan.
  void setMockTrashClass(WasteClass wasteClass) {
    final detector = _detector;
    if (detector is MockDetector) {
      detector.simulatedTrashClass = wasteClass;
    }
  }

  void setMockSimulateWrongBin(bool value) {
    final detector = _detector;
    if (detector is MockDetector) detector.simulateWrongBin = value;
  }

  bool get isMockDetector => _detector is MockDetector;

  void scan() {
    final detections = _detector.detectFrame();
    final result = matchDetections(detections);
    state = switch (result.status) {
      MatchStatus.incomplete => const WasteScanState.incomplete(),
      MatchStatus.mismatched => WasteScanState.previewMismatch(trashClass: result.trashClass!),
      MatchStatus.matched => WasteScanState.previewMatch(
          trashClass: result.trashClass!,
          confidence: result.confidence!,
        ),
    };
  }

  Future<void> submit() async {
    final current = state;
    if (current is! _PreviewMatch) return;

    state = const WasteScanState.submitting();
    final key = _idempotency.keyFor(_idempotencyActionKey);
    try {
      final result = await _repo.submit(
        WasteScanSubmitRequest(
          classifiedLabel: current.trashClass.apiLabel,
          confidence: current.confidence,
        ),
        idempotencyKey: key,
      );
      _idempotency.reset(_idempotencyActionKey);
      state = WasteScanState.success(result);
    } catch (e) {
      // Key SENGAJA tidak di-reset — retry submit() berikutnya pakai key yang
      // sama supaya backend replay response pertama, bukan eksekusi ulang.
      state = WasteScanState.error(e.toString());
      rethrow;
    }
  }

  void reset() {
    _idempotency.reset(_idempotencyActionKey);
    state = const WasteScanState.idle();
  }
}
