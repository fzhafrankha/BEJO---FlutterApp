import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tamagotchi_app/features/profile/application/notification_setting_notifier.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('default aktif (belum pernah diubah)', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    container.read(notificationSettingNotifierProvider.notifier);
    await Future<void>.delayed(Duration.zero);

    expect(container.read(notificationSettingNotifierProvider).value, true);
  });

  test('toggle menyimpan preferensi lokal dan bertahan di sesi baru', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final notifier = container.read(notificationSettingNotifierProvider.notifier);
    await Future<void>.delayed(Duration.zero);
    await notifier.toggle();

    expect(container.read(notificationSettingNotifierProvider).value, false);

    final container2 = ProviderContainer();
    addTearDown(container2.dispose);
    container2.read(notificationSettingNotifierProvider.notifier);
    await Future<void>.delayed(Duration.zero);

    expect(container2.read(notificationSettingNotifierProvider).value, false);
  });
}
