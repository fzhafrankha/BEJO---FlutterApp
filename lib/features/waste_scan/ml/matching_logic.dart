import 'detection.dart';

enum MatchStatus { incomplete, matched, mismatched }

/// Hasil pencocokan sampah↔tong dari satu frame (`docs/ARCHITECTURE.md` §4.3).
/// Pure function, tidak butuh device fisik untuk ditest.
class MatchResult {
  final MatchStatus status;
  final WasteClass? trashClass;
  final double? confidence;

  const MatchResult._(this.status, this.trashClass, this.confidence);

  factory MatchResult.incomplete() => const MatchResult._(MatchStatus.incomplete, null, null);
  factory MatchResult.matched(WasteClass trashClass, double confidence) =>
      MatchResult._(MatchStatus.matched, trashClass, confidence);
  factory MatchResult.mismatched(WasteClass trashClass, double confidence) =>
      MatchResult._(MatchStatus.mismatched, trashClass, confidence);
}

const _correctBinFor = {
  WasteClass.organik: WasteClass.tongOrganik,
  WasteClass.anorganik: WasteClass.tongAnorganik,
  WasteClass.b3: WasteClass.tongB3,
};

WasteClass correctBinFor(WasteClass trashClass) => _correctBinFor[trashClass]!;

/// - Grup sampah/tong belum lengkap → [MatchStatus.incomplete] (UI: "arahkan
///   kamera ke sampah & tong bersamaan").
/// - Beberapa deteksi dalam satu grup → ambil confidence tertinggi.
/// - Cocokkan pasangan (organik↔tong_organik, dst) → matched/mismatched.
MatchResult matchDetections(List<Detection> detections) {
  final trash = detections.where((d) => d.wasteClass.isTrash).toList();
  final bins = detections.where((d) => d.wasteClass.isBin).toList();

  if (trash.isEmpty || bins.isEmpty) {
    return MatchResult.incomplete();
  }

  Detection highestConfidence(List<Detection> list) =>
      list.reduce((a, b) => a.confidence >= b.confidence ? a : b);

  final bestTrash = highestConfidence(trash);
  final bestBin = highestConfidence(bins);

  if (_correctBinFor[bestTrash.wasteClass] == bestBin.wasteClass) {
    return MatchResult.matched(bestTrash.wasteClass, bestTrash.confidence);
  }
  return MatchResult.mismatched(bestTrash.wasteClass, bestTrash.confidence);
}
