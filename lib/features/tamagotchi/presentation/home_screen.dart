import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/error_messages.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../auth/application/auth_notifier.dart';
import '../application/tamagotchi_notifier.dart';
import 'widgets/happiness_arc.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tamagotchiAsync = ref.watch(tamagotchiNotifierProvider);
    final authState = ref.watch(authNotifierProvider);
    final currencyBalance = authState.maybeWhen(
      authenticated: (user) => user.currencyBalance,
      orElse: () => null,
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => ref.read(tamagotchiNotifierProvider.notifier).refresh(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (currencyBalance != null)
                        Chip(
                          avatar: const Icon(Icons.eco, size: 18, color: AppColors.buttonGreenBg),
                          label: Text('$currencyBalance EcoP'),
                          backgroundColor: Colors.white,
                        )
                      else
                        const SizedBox.shrink(),
                      IconButton(
                        icon: const Icon(Icons.shopping_cart_outlined),
                        onPressed: () => context.push(AppRoutes.shop),
                      ),
                    ],
                  ),
                ),
                tamagotchiAsync.when(
                  loading: () => const Padding(
                    padding: EdgeInsets.all(48),
                    child: CircularProgressIndicator(),
                  ),
                  error: (err, st) => Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Text(
                          err is ApiException ? errorMessageFor(err) : 'Gagal memuat tamagotchi',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () => ref.read(tamagotchiNotifierProvider.notifier).refresh(),
                          child: const Text('Coba lagi'),
                        ),
                      ],
                    ),
                  ),
                  data: (tamagotchi) => _TamagotchiBody(happiness: tamagotchi.happiness),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TamagotchiBody extends ConsumerWidget {
  final int happiness;
  const _TamagotchiBody({required this.happiness});

  Future<void> _feed(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(tamagotchiNotifierProvider.notifier).feed();
    } on ApiException catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessageFor(e))));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final equippedAccessories = ref.watch(tamagotchiNotifierProvider).value?.equippedAccessories ?? [];

    return Column(
      children: [
        HappinessArc(
          happiness: happiness,
          child: SvgPicture.asset('assets/images/mascot/bejo_atas.svg', width: 180),
        ),
        const SizedBox(height: 12),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF3F6B1B).withValues(alpha: 0.79),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Fitur nama tamagotchi segera hadir')),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Bejo', style: TextStyle(color: AppColors.buttonGreenText, fontWeight: FontWeight.w600)),
                      SizedBox(width: 6),
                      Icon(Icons.edit, size: 16, color: AppColors.buttonGreenText),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.restaurant, color: Color(0xFFE8F0DC), size: 20),
                  const SizedBox(width: 6),
                  Text('$happiness %', style: const TextStyle(color: Color(0xFFE8F0DC), fontSize: 18)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _feed(context, ref),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonGreenBg,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
                      ),
                      child: const Text('Makan', style: TextStyle(color: Color(0xFFB2D959), fontWeight: FontWeight.w700)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => context.push(AppRoutes.shop),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFF3D6),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
                      ),
                      child: const Text('Personalisasi', style: TextStyle(color: Color(0xFFFFC94D), fontWeight: FontWeight.w700)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: const Color(0xFFFFF3D6), borderRadius: BorderRadius.circular(12)),
                child: equippedAccessories.isEmpty
                    ? const Text('Belum ada aksesoris terpasang', style: TextStyle(fontSize: 13))
                    : Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: equippedAccessories
                            .map((a) => Chip(label: Text('${a.name} (${a.slot.name})')))
                            .toList(),
                      ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.push(AppRoutes.quizHappiness),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
                  ),
                  child: const Text('Quiz Perasaan', style: TextStyle(color: AppColors.buttonGreenText, fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
