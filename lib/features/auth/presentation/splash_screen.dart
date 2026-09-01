import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import 'widgets/mascot_header.dart';

/// Ditampilkan singkat saat `AuthNotifier` restore sesi dari secure storage
/// (state `AuthState.unknown()`) — router redirect otomatis lanjut ke
/// login/home begitu status diketahui, screen ini tidak punya navigasi manual.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MascotHeader(height: 220),
            const SizedBox(height: 24),
            const CircularProgressIndicator(color: AppColors.buttonGreenBg),
          ],
        ),
      ),
    );
  }
}
