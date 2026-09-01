import 'package:flutter/material.dart';

/// Token warna diambil langsung dari Figma (`fileKey=0OVVdxVP3LKaQ9Cyxxrs26`,
/// layar Login/Sign up/Verifikasi) — dipakai konsisten lintas layar auth &
/// seterusnya, bukan warna Material default.
class AppColors {
  AppColors._();

  static const background = Color(0xFFFFFBE7);
  static const inputYellow = Color(0xFFFED24F);
  static const inputPlaceholder = Color(0xAAFFF449);
  static const otpBoxYellow = Color(0xADFED24F);
  static const headingNavy = Color(0xFF070F36);
  static const buttonGreenBg = Color(0xFF7EC151);
  static const buttonGreenText = Color(0xD6158D3D);
  static const mascotGreen = Color(0xFF8BD614);
  static const textBlack = Colors.black;
  static const settingsCardGreen = Color(0xFFD9E2B3);
  static const chartBarPurple = Color(0xFF8979FF);
}

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.buttonGreenBg,
          surface: AppColors.background,
        ),
      );
}
