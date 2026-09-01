import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/error_messages.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../auth/application/auth_notifier.dart';
import '../application/waste_scan_notifier.dart';
import '../ml/detection.dart';

class WasteScanScreen extends ConsumerStatefulWidget {
  const WasteScanScreen({super.key});

  @override
  ConsumerState<WasteScanScreen> createState() => _WasteScanScreenState();
}

class _WasteScanScreenState extends ConsumerState<WasteScanScreen> {
  WasteClass _selectedClass = WasteClass.organik;
  bool _simulateWrongBin = false;
  bool _submitting = false;

  Future<void> _submit() async {
    setState(() => _submitting = true);
    try {
      await ref.read(wasteScanNotifierProvider.notifier).submit();
      await ref.read(authNotifierProvider.notifier).refreshUser();
      if (!mounted) return;
      context.push(AppRoutes.wasteScanResult);
    } on ApiException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessageFor(e))));
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(wasteScanNotifierProvider.notifier);
    final state = ref.watch(wasteScanNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Scan Sampah'), backgroundColor: AppColors.background),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (notifier.isMockDetector) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Mode simulasi — model deteksi asli belum tersedia. Pilih jenis sampah '
                  'untuk mensimulasikan hasil kamera, lalu tekan "Scan".',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Simulasikan sampah:', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [WasteClass.organik, WasteClass.anorganik, WasteClass.b3].map((c) {
                  return ChoiceChip(
                    label: Text(c.apiLabel),
                    selected: _selectedClass == c,
                    onSelected: (_) {
                      setState(() => _selectedClass = c);
                      notifier.setMockTrashClass(c);
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 8),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Simulasikan tong salah'),
                value: _simulateWrongBin,
                onChanged: (v) {
                  setState(() => _simulateWrongBin = v);
                  notifier.setMockSimulateWrongBin(v);
                },
              ),
              const SizedBox(height: 8),
            ],
            Center(
              child: ElevatedButton.icon(
                onPressed: () => notifier.scan(),
                icon: const Icon(Icons.camera_alt),
                label: const Text('Scan'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonGreenBg,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _ResultPreview(state: state),
            if (state.maybeWhen(previewMatch: (_, _) => true, orElse: () => false)) ...[
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitting ? null : _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonGreenBg,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: _submitting
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Text('Kirim & Dapatkan EcoPoin', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ResultPreview extends StatelessWidget {
  final WasteScanState state;
  const _ResultPreview({required this.state});

  @override
  Widget build(BuildContext context) {
    return state.when(
      idle: () => const Text('Belum ada hasil scan.'),
      incomplete: () => const _Banner(
        color: Colors.orange,
        text: 'Arahkan kamera ke sampah & tong bersamaan.',
      ),
      previewMismatch: (trashClass) => _Banner(
        color: Colors.red,
        text: 'Salah tong! ${trashClass.apiLabel} tidak cocok dengan tong ini.',
      ),
      previewMatch: (trashClass, confidence) => _Banner(
        color: Colors.green,
        text: 'Benar! ${trashClass.apiLabel} masuk tong yang tepat '
            '(confidence ${(confidence * 100).toStringAsFixed(0)}%).',
      ),
      submitting: () => const Center(child: CircularProgressIndicator()),
      success: (result) => _Banner(
        color: Colors.green,
        text: 'Berhasil! +${result.currencyAwarded} EcoPoin.',
      ),
      error: (message) => _Banner(color: Colors.red, text: message),
    );
  }
}

class _Banner extends StatelessWidget {
  final Color color;
  final String text;
  const _Banner({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(12)),
      child: Text(text, style: TextStyle(color: color.withValues(alpha: 1), fontWeight: FontWeight.w600)),
    );
  }
}
