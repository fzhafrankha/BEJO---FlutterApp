import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';
import '../application/waste_scan_notifier.dart';

class WasteScanResultScreen extends ConsumerWidget {
  const WasteScanResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(wasteScanNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: state.maybeWhen(
              success: (result) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.emoji_events, size: 80, color: AppColors.buttonGreenBg),
                  const SizedBox(height: 16),
                  Text(
                    '+${result.currencyAwarded} EcoPoin',
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 8),
                  Text('Saldo sekarang: ${result.currencyBalance} EcoPoin'),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(wasteScanNotifierProvider.notifier).reset();
                      context.go(AppRoutes.home);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.buttonGreenBg),
                    child: const Text('Kembali ke Tamagotchi', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              orElse: () => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Tidak ada hasil scan terbaru.'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.go(AppRoutes.wasteScan),
                    child: const Text('Scan lagi'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
