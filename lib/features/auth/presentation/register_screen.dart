import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/error_messages.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';
import '../application/auth_notifier.dart';
import 'widgets/auth_text_field.dart';
import 'widgets/mascot_header.dart';
import 'widgets/pill_button.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _loading = false;
  String? _errorText;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (username.length < 3) {
      setState(() => _errorText = 'Nama minimal 3 karakter');
      return;
    }
    if (email.isEmpty) {
      setState(() => _errorText = 'Email wajib diisi');
      return;
    }
    if (password.length < 8) {
      setState(() => _errorText = 'Kata sandi minimal 8 karakter (kombinasi huruf & angka)');
      return;
    }

    setState(() {
      _loading = true;
      _errorText = null;
    });
    try {
      await ref
          .read(authNotifierProvider.notifier)
          .register(email: email, password: password, username: username);
      // Navigasi ke OTP ditangani redirect guard begitu state jadi otpPending.
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _errorText = errorMessageFor(e));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MascotHeader(),
              const SizedBox(height: 8),
              const Text(
                'Daftar',
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w800,
                  color: AppColors.headingNavy,
                ),
              ),
              const SizedBox(height: 24),
              AuthTextField(
                controller: _usernameController,
                hintText: 'Nama Panjang',
                autofillHints: Autofillable.name,
              ),
              const SizedBox(height: 16),
              AuthTextField(
                controller: _emailController,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                autofillHints: Autofillable.email,
              ),
              const SizedBox(height: 16),
              AuthTextField(
                controller: _passwordController,
                hintText: 'Kata Sandi',
                obscureText: _obscurePassword,
                autofillHints: Autofillable.newPassword,
                onToggleObscure: () => setState(() => _obscurePassword = !_obscurePassword),
              ),
              if (_errorText != null) ...[
                const SizedBox(height: 12),
                Text(_errorText!, style: const TextStyle(color: Colors.red)),
              ],
              const SizedBox(height: 24),
              PillButton(
                label: 'Lanjut',
                onPressed: _submit,
                loading: _loading,
                filled: true,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Sudah punya akun? '),
                  GestureDetector(
                    onTap: () => context.go(AppRoutes.login),
                    child: const Text('Masuk aja', style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
