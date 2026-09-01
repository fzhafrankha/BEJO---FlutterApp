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

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _loading = false;
  String? _errorText;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      setState(() => _errorText = 'Email dan kata sandi wajib diisi');
      return;
    }

    setState(() {
      _loading = true;
      _errorText = null;
    });
    try {
      await ref.read(authNotifierProvider.notifier).login(email: email, password: password);
      // Navigasi ditangani oleh redirect guard di app_router.dart begitu
      // AuthState berubah — tidak perlu context.go manual di sini.
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _errorText = errorMessageFor(e));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Tampilkan pesan transient dari AuthNotifier (mis. "Akun terverifikasi,
    // silakan masuk" setelah OTP sukses, atau "Sesi berakhir" dari auto-logout)
    // — hanya sekali per transisi state, bukan tiap rebuild.
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      final message = next.maybeWhen(unauthenticated: (msg) => msg, orElse: () => null);
      if (message != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      }
    });

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
                'Masuk',
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w800,
                  color: AppColors.headingNavy,
                ),
              ),
              const SizedBox(height: 24),
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
                autofillHints: Autofillable.password,
                onToggleObscure: () => setState(() => _obscurePassword = !_obscurePassword),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Fitur reset kata sandi belum tersedia, hubungi admin')),
                    );
                  },
                  style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
                  child: const Text('Lupa sandi?', style: TextStyle(color: Colors.black)),
                ),
              ),
              if (_errorText != null) ...[
                const SizedBox(height: 4),
                Text(_errorText!, style: const TextStyle(color: Colors.red)),
              ],
              const SizedBox(height: 16),
              PillButton(label: 'Lanjut', onPressed: _submit, loading: _loading),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Belum punya akun? '),
                  GestureDetector(
                    onTap: () => context.go(AppRoutes.register),
                    child: const Text(
                      'Daftar dulu yuk!',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
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
