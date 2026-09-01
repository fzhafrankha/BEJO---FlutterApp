import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tamagotchi_app/features/shop/application/shop_notifiers.dart';
import 'package:tamagotchi_app/features/shop/data/shop_models.dart';
import 'package:tamagotchi_app/features/shop/presentation/shop_screen.dart';
import 'package:tamagotchi_app/shared/models/accessory_slot.dart';

class _FakeMyAccessoriesNotifier extends MyAccessoriesNotifier {
  @override
  Future<List<UserAccessory>> build() async => const [
        UserAccessory(
          id: 1,
          name: 'Topi Daun',
          category: AccessoryCategory.accessory,
          slot: AccessorySlot.kepala,
          imageUrl: '/uploads/accessories/topi-daun.png',
          isEquipped: true,
          quantity: 1,
        ),
        UserAccessory(
          id: 2,
          name: 'Mahkota Kaleng',
          category: AccessoryCategory.accessory,
          slot: AccessorySlot.kepala,
          imageUrl: '/uploads/accessories/mahkota.png',
          isEquipped: false,
          quantity: 1,
        ),
      ];
}

// Tab Makanan/Aksesori tetap ada di widget tree (TabBarView build semua child
// sekaligus) — override catalog dengan list kosong supaya tidak memicu
// network call nyata ke backend selama test.
class _FakeCatalogNotifier extends CatalogNotifier {
  @override
  Future<List<Accessory>> build() async => const [];
}

void main() {
  testWidgets('koleksiku menampilkan status equip per-slot dengan benar', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          myAccessoriesNotifierProvider.overrideWith(_FakeMyAccessoriesNotifier.new),
          catalogNotifierProvider.overrideWith(_FakeCatalogNotifier.new),
        ],
        child: const MaterialApp(home: ShopScreen()),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Koleksiku'));
    await tester.pumpAndSettle();

    expect(find.text('Terpasang'), findsOneWidget);
    expect(find.text('Pasang'), findsOneWidget);
  });
}
