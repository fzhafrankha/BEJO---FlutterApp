import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

/// Halaman statis lokal (bukan tautan eksternal) — backend tidak punya
/// endpoint Terms/Privacy, lihat plan Phase 7 & `docs/PRD.md` decision log.
class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Syarat & Kebijakan Privasi'),
        backgroundColor: AppColors.background,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Syarat & Ketentuan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.headingNavy),
            ),
            SizedBox(height: 8),
            Text(
              'Dengan menggunakan aplikasi ini, kamu setuju untuk memakainya sesuai tujuan edukasi 3R '
              '(Reduce, Reuse, Recycle) dan tidak menyalahgunakan fitur seperti scan sampah, quiz, shop, '
              'atau diskusi dengan AI untuk hal di luar konteks edukasi lingkungan.',
            ),
            SizedBox(height: 20),
            Text(
              'Kebijakan Privasi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.headingNavy),
            ),
            SizedBox(height: 8),
            Text(
              'Kami menyimpan data akun (email, username, foto profil), progres edukasi (chapter, quiz), '
              'riwayat scan sampah, dan riwayat transaksi EcoPoin untuk menjalankan fitur aplikasi. '
              'Foto profil yang kamu unggah disimpan di server aplikasi dan hanya dipakai untuk ditampilkan '
              'kembali di akunmu. Data tidak dibagikan ke pihak ketiga di luar penyedia layanan yang '
              'dipakai aplikasi ini (mis. penyedia model AI untuk fitur Diskusi dengan AI).',
            ),
            SizedBox(height: 20),
            Text(
              'Untuk pertanyaan lebih lanjut, silakan hubungi tim pengembang melalui kontak yang tersedia '
              'pada deskripsi aplikasi.',
            ),
          ],
        ),
      ),
    );
  }
}
