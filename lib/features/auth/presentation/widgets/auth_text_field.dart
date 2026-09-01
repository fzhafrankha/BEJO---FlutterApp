import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Pill kuning khas layar auth Figma — dipakai untuk field Nama/Email/Kata Sandi.
class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final VoidCallback? onToggleObscure;
  final TextInputType? keyboardType;
  final String? errorText;
  final Autofillable autofillHints;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.onToggleObscure,
    this.keyboardType,
    this.errorText,
    this.autofillHints = Autofillable.none,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      autofillHints: switch (autofillHints) {
        Autofillable.email => const [AutofillHints.email],
        Autofillable.password => const [AutofillHints.password],
        Autofillable.newPassword => const [AutofillHints.newPassword],
        Autofillable.name => const [AutofillHints.name],
        Autofillable.none => null,
      },
      style: const TextStyle(
        color: AppColors.headingNavy,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.inputYellow,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.inputPlaceholder,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        errorText: errorText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide.none,
        ),
        suffixIcon: onToggleObscure == null
            ? null
            : IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.headingNavy.withValues(alpha: 0.5),
                ),
                onPressed: onToggleObscure,
              ),
      ),
    );
  }
}

enum Autofillable { none, email, password, newPassword, name }
