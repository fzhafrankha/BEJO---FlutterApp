import 'package:flutter_test/flutter_test.dart';
import 'package:tamagotchi_app/features/waste_scan/ml/detection.dart';
import 'package:tamagotchi_app/features/waste_scan/ml/matching_logic.dart';

void main() {
  Detection d(WasteClass c, double conf) => Detection(wasteClass: c, confidence: conf);

  test('grup sampah kosong -> incomplete', () {
    final result = matchDetections([d(WasteClass.tongOrganik, 0.9)]);
    expect(result.status, MatchStatus.incomplete);
  });

  test('grup tong kosong -> incomplete', () {
    final result = matchDetections([d(WasteClass.organik, 0.9)]);
    expect(result.status, MatchStatus.incomplete);
  });

  test('tidak ada deteksi sama sekali -> incomplete', () {
    final result = matchDetections([]);
    expect(result.status, MatchStatus.incomplete);
  });

  test('organik + tong_organik -> matched', () {
    final result = matchDetections([d(WasteClass.organik, 0.8), d(WasteClass.tongOrganik, 0.7)]);
    expect(result.status, MatchStatus.matched);
    expect(result.trashClass, WasteClass.organik);
    expect(result.confidence, 0.8);
  });

  test('anorganik + tong_organik -> mismatched', () {
    final result = matchDetections([d(WasteClass.anorganik, 0.8), d(WasteClass.tongOrganik, 0.7)]);
    expect(result.status, MatchStatus.mismatched);
    expect(result.trashClass, WasteClass.anorganik);
  });

  test('B3 + tong_B3 -> matched', () {
    final result = matchDetections([d(WasteClass.b3, 0.6), d(WasteClass.tongB3, 0.95)]);
    expect(result.status, MatchStatus.matched);
    expect(result.trashClass, WasteClass.b3);
  });

  test('beberapa deteksi di grup yang sama -> ambil confidence tertinggi', () {
    final result = matchDetections([
      d(WasteClass.organik, 0.4),
      d(WasteClass.anorganik, 0.95),
      d(WasteClass.tongAnorganik, 0.9),
      d(WasteClass.tongOrganik, 0.3),
    ]);
    expect(result.status, MatchStatus.matched);
    expect(result.trashClass, WasteClass.anorganik);
    expect(result.confidence, 0.95);
  });

  test('correctBinFor memetakan tiap kelas sampah ke tong yang benar', () {
    expect(correctBinFor(WasteClass.organik), WasteClass.tongOrganik);
    expect(correctBinFor(WasteClass.anorganik), WasteClass.tongAnorganik);
    expect(correctBinFor(WasteClass.b3), WasteClass.tongB3);
  });
}
