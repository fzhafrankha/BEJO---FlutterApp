import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _prefsKey = 'notification_enabled';

/// Preferensi lokal saja (tidak ada endpoint notifikasi push di backend) —
/// lihat `docs/PRD.md` decision log & plan Phase 7: Bahasa/Tema dikunci untuk
/// MVP, tapi Notification adalah toggle lokal yang genuinely fungsional.
final notificationSettingNotifierProvider =
    AsyncNotifierProvider<NotificationSettingNotifier, bool>(NotificationSettingNotifier.new);

class NotificationSettingNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_prefsKey) ?? true;
  }

  Future<void> toggle() async {
    final current = state.value ?? true;
    final next = !current;
    state = AsyncData(next);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefsKey, next);
  }
}
