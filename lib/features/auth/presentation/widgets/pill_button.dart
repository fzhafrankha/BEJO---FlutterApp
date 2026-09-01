import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Tombol pill khas layar auth Figma. [filled]=true -> latar hijau solid teks
/// putih (variant "Kirim OTP"); [filled]=false -> latar putih teks hijau
/// (variant "Lanjut"/"Verifikasi").
class PillButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool filled;
  final bool loading;

  const PillButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.filled = false,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    final disabled = onPressed == null || loading;
    return SizedBox(
      height: 60,
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: filled ? AppColors.buttonGreenBg : Colors.white,
          disabledBackgroundColor: filled
              ? AppColors.buttonGreenBg.withValues(alpha: 0.5)
              : Colors.white.withValues(alpha: 0.6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
          elevation: 0,
        ),
        child: loading
            ? SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: filled ? Colors.white : AppColors.buttonGreenText,
                ),
              )
            : Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: filled ? Colors.white : AppColors.buttonGreenText,
                ),
              ),
      ),
    );
  }
}
