import 'detection.dart';
import 'matching_logic.dart';

/// Detector simulasi — dipakai sampai model `.tflite` hasil training tersedia
/// (`model/runs/export/` masih kosong saat frontend ini dibangun, lihat
/// keputusan interview: "Mock detector + seam siap").
///
/// Tidak berpura-pura ada live camera feed (jujur ke pengguna internal/QA):
/// [simulatedTrashClass] di-set dari UI lewat tombol pilihan kelas sampah,
/// menggantikan apa yang seharusnya dideteksi kamera dari `YoloView`.
class MockDetector implements Detector {
  WasteClass simulatedTrashClass = WasteClass.organik;
  bool simulateWrongBin = false;
  bool simulateIncomplete = false;

  @override
  Future<void> load() async {}

  @override
  List<Detection> detectFrame() {
    if (simulateIncomplete) return const [];

    final correctBin = correctBinFor(simulatedTrashClass);
    final binClass = simulateWrongBin
        ? WasteClass.values.firstWhere((c) => c.isBin && c != correctBin)
        : correctBin;

    return [
      Detection(wasteClass: simulatedTrashClass, confidence: 0.93),
      Detection(wasteClass: binClass, confidence: 0.89),
    ];
  }

  @override
  Future<void> dispose() async {}
}
