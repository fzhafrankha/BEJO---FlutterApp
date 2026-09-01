/// 6 kelas model YOLOv8 (`model/docs/INTEGRATION.md`) — urutan ini WAJIB sama
/// persis dengan `assets/model/labels.txt` saat model asli di-drop nanti.
enum WasteClass { organik, anorganik, b3, tongOrganik, tongAnorganik, tongB3 }

extension WasteClassLabel on WasteClass {
  /// Label yang dikirim ke `POST /waste-scan/submit` (hanya utk kelas sampah,
  /// bukan tong) — harus salah satu dari: organik, anorganik, B3.
  String get apiLabel => switch (this) {
        WasteClass.organik => 'organik',
        WasteClass.anorganik => 'anorganik',
        WasteClass.b3 => 'B3',
        _ => throw StateError('$this bukan kelas sampah, tidak punya apiLabel'),
      };

  bool get isTrash => this == WasteClass.organik || this == WasteClass.anorganik || this == WasteClass.b3;
  bool get isBin => !isTrash;
}

/// Satu hasil deteksi dari satu frame kamera.
class Detection {
  final WasteClass wasteClass;
  final double confidence;

  Detection({required this.wasteClass, required this.confidence});
}

/// Seam untuk model TFLite asli (`model/scripts/export_tflite.py`) — belum
/// ditraining saat frontend ini dibangun, jadi dipakai [MockDetector] dulu.
/// Ganti implementasi ini dengan wrapper `ultralytics_yolo` begitu
/// `assets/model/best_int8.tflite` tersedia, tanpa mengubah pemanggil
/// (`docs/ARCHITECTURE.md` §4).
abstract class Detector {
  Future<void> load();
  List<Detection> detectFrame();
  Future<void> dispose();
}
