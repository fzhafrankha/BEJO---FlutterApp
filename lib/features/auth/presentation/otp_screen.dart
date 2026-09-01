import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/error_messages.dart';
import '../../../core/theme/app_theme.dart';
import '../application/auth_notifier.dart';
import 'widgets/mascot_header.dart';
import 'widgets/pill_button.dart';

const _otpResendCooldownSeconds = 60;

class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({super.key});

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  final _controllers = List.generate(6, (_) => TextEditingController());
  final _focusNodes = List.generate(6, (_) => FocusNode());

  Timer? _cooldownTimer;
  int _cooldownSeconds = _otpResendCooldownSeconds;
  bool _verifying = false;
  bool _resending = false;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    // OTP pertama sudah dikirim otomatis oleh AuthNotifier.register() sebelum
    // masuk ke screen ini — mulai cooldown langsung supaya user tidak spam kirim ulang.
    _startCooldown();
  }

  @override
  void dispose() {
    _cooldownTimer?.cancel();
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _startCooldown() {
    setState(() => _cooldownSeconds = _otpResendCooldownSeconds);
    _cooldownTimer?.cancel();
    _cooldownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_cooldownSeconds <= 1) {
        timer.cancel();
        setState(() => _cooldownSeconds = 0);
      } else {
        setState(() => _cooldownSeconds -= 1);
      }
    });
  }

  String get _email {
    final state = ref.read(authNotifierProvider);
    return state.maybeWhen(otpPending: (email) => email, orElse: () => '');
  }

  String get _code => _controllers.map((c) => c.text).join();

  Future<void> _resend() async {
    setState(() {
      _resending = true;
      _errorText = null;
    });
    try {
      await ref.read(authNotifierProvider.notifier).resendOtp(_email);
      _startCooldown();
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _errorText = errorMessageFor(e));
    } finally {
      if (mounted) setState(() => _resending = false);
    }
  }

  Future<void> _verify() async {
    if (_code.length != 6) {
      setState(() => _errorText = 'Masukkan 6 digit kode OTP');
      return;
    }
    setState(() {
      _verifying = true;
      _errorText = null;
    });
    try {
      await ref.read(authNotifierProvider.notifier).verifyOtp(email: _email, code: _code);
      // Redirect ke login ditangani app_router.dart begitu state jadi unauthenticated.
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _errorText = errorMessageFor(e));
      for (final c in _controllers) {
        c.clear();
      }
      _focusNodes.first.requestFocus();
    } finally {
      if (mounted) setState(() => _verifying = false);
    }
  }

  Widget _pinBox(int index) {
    return SizedBox(
      width: 45,
      height: 60,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: AppColors.otpBoxYellow,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            _focusNodes[index + 1].requestFocus();
          } else if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus();
          }
          setState(() {});
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const MascotHeader(),
              const SizedBox(height: 8),
              const Text(
                'Verifikasi',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: AppColors.headingNavy,
                ),
              ),
              const SizedBox(height: 8),
              Text('Kode OTP telah dikirim ke $_email', textAlign: TextAlign.center),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, _pinBox),
              ),
              if (_errorText != null) ...[
                const SizedBox(height: 12),
                Text(_errorText!, style: const TextStyle(color: Colors.red)),
              ],
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: PillButton(
                      label: _cooldownSeconds > 0 ? 'Kirim OTP (${_cooldownSeconds}s)' : 'Kirim OTP',
                      filled: true,
                      loading: _resending,
                      onPressed: _cooldownSeconds > 0 ? null : _resend,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: PillButton(label: 'Verifikasi', loading: _verifying, onPressed: _verify),
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
