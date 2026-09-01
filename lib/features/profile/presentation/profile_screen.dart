import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import '../../../core/network/error_messages.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../auth/application/auth_notifier.dart';
import '../../points_history/application/point_history_notifier.dart';
import '../application/notification_setting_notifier.dart';
import 'widgets/weekly_ecopoin_chart.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  Future<void> _logout(BuildContext context, WidgetRef ref) async {
    await ref.read(authNotifierProvider.notifier).logout();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authNotifierProvider).maybeWhen(authenticated: (u) => u, orElse: () => null);
    final notificationEnabled = ref.watch(notificationSettingNotifierProvider).value ?? true;
    final weeklyAsync = ref.watch(pointHistoryNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Profil'), backgroundColor: AppColors.background),
      body: RefreshIndicator(
        onRefresh: () => ref.read(pointHistoryNotifierProvider.notifier).refresh(),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(color: AppColors.settingsCardGreen, borderRadius: BorderRadius.circular(24)),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 44,
                    backgroundColor: Colors.white,
                    backgroundImage: user != null && user.avatarUrl.isNotEmpty
                        ? NetworkImage(resolveMediaUrl(user.avatarUrl))
                        : null,
                    child: user == null || user.avatarUrl.isEmpty
                        ? const Icon(Icons.person, size: 40, color: Colors.black26)
                        : null,
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () => context.push(AppRoutes.profileEdit),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.edit, size: 16, color: AppColors.headingNavy),
                        const SizedBox(width: 6),
                        Text(
                          user?.username ?? '-',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.headingNavy),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(user?.email ?? '', style: const TextStyle(color: AppColors.headingNavy)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: AppColors.settingsCardGreen, borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Pengaturan', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: AppColors.headingNavy)),
                  const SizedBox(height: 16),
                  const _SettingsRow(icon: Icons.language, label: 'Bahasa', value: 'Indonesia'),
                  const SizedBox(height: 16),
                  const _SettingsRow(icon: Icons.palette_outlined, label: 'Tema', value: 'Bawaan'),
                  const SizedBox(height: 16),
                  _SettingsRow(
                    icon: Icons.notifications_outlined,
                    label: 'Notification',
                    value: notificationEnabled ? 'Diaktifkan' : 'Dinonaktifkan',
                    onTap: () => ref.read(notificationSettingNotifierProvider.notifier).toggle(),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () => context.push(AppRoutes.profileTerms),
                    child: const Row(
                      children: [
                        Icon(Icons.description_outlined, color: AppColors.headingNavy),
                        SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            'Terms & Conditions and Privacy Policy',
                            style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.headingNavy),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: AppColors.settingsCardGreen, borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Riwayat EcoP Dalam Seminggu',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.headingNavy),
                  ),
                  const SizedBox(height: 16),
                  weeklyAsync.when(
                    loading: () => const Padding(
                      padding: EdgeInsets.all(24),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    error: (err, st) => Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(err is ApiException ? errorMessageFor(err) : 'Gagal memuat riwayat EcoPoin'),
                    ),
                    data: (weekly) => WeeklyEcopoinChart(days: weekly.days),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => _logout(context, ref),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: const BorderSide(color: Colors.redAccent),
                ),
                child: const Text('Keluar', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;
  const _SettingsRow({required this.icon, required this.label, required this.value, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: AppColors.headingNavy),
          const SizedBox(width: 16),
          Expanded(
            child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.headingNavy)),
          ),
          Text(value, style: const TextStyle(color: AppColors.headingNavy)),
        ],
      ),
    );
  }
}
