import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import '../../../core/network/error_messages.dart';
import '../../../core/network/idempotency.dart';
import '../../../core/theme/app_theme.dart';
import '../../auth/application/auth_notifier.dart';
import '../../tamagotchi/application/tamagotchi_notifier.dart';
import '../application/shop_notifiers.dart';
import '../data/shop_models.dart';
import '../data/shop_repository.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text('Shop'),
          backgroundColor: AppColors.background,
          bottom: const TabBar(
            labelColor: AppColors.buttonGreenBg,
            indicatorColor: AppColors.buttonGreenBg,
            tabs: [
              Tab(text: 'Makanan'),
              Tab(text: 'Aksesori'),
              Tab(text: 'Gacha'),
              Tab(text: 'Koleksiku'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _CatalogGrid(category: AccessoryCategory.food),
            _CatalogGrid(category: AccessoryCategory.accessory),
            _GachaTab(),
            _KoleksikuTab(),
          ],
        ),
      ),
    );
  }
}

class _CatalogGrid extends ConsumerWidget {
  final AccessoryCategory category;
  const _CatalogGrid({required this.category});

  Future<void> _purchase(BuildContext context, WidgetRef ref, Accessory item) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Beli ${item.name}?'),
        content: Text('Harga: ${item.price} EcoPoin'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Batal')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Beli')),
        ],
      ),
    );
    if (confirmed != true) return;

    final actionKey = 'purchase_${item.id}';
    final key = ref.read(idempotencyKeyManagerProvider).keyFor(actionKey);
    try {
      await ref.read(shopRepositoryProvider).purchase(item.id, idempotencyKey: key);
      ref.read(idempotencyKeyManagerProvider).reset(actionKey);
      await ref.read(myAccessoriesNotifierProvider.notifier).refresh();
      await ref.read(authNotifierProvider.notifier).refreshUser();
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${item.name} berhasil dibeli!')));
    } on ApiException catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessageFor(e))));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catalogAsync = ref.watch(catalogNotifierProvider);

    return catalogAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, st) => Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(err is ApiException ? errorMessageFor(err) : 'Gagal memuat katalog'),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => ref.read(catalogNotifierProvider.notifier).refresh(),
                child: const Text('Coba lagi'),
              ),
            ],
          ),
        ),
      ),
      data: (items) {
        final filtered = items.where((a) => a.category == category).toList();
        if (filtered.isEmpty) {
          return const Center(child: Text('Belum ada item di kategori ini.'));
        }
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.85,
          ),
          itemCount: filtered.length,
          itemBuilder: (context, i) {
            final item = filtered[i];
            return InkWell(
              onTap: () => _purchase(context, ref, item),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xBAFED24F),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.network(
                        resolveMediaUrl(item.imageUrl),
                        errorBuilder: (context, error, stack) => Icon(
                          item.category == AccessoryCategory.food ? Icons.restaurant : Icons.checkroom,
                          size: 40,
                          color: AppColors.headingNavy.withValues(alpha: 0.4),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(item.name, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
                    const SizedBox(height: 2),
                    Text('${item.price} EcoP', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _GachaTab extends ConsumerStatefulWidget {
  const _GachaTab();

  @override
  ConsumerState<_GachaTab> createState() => _GachaTabState();
}

class _GachaTabState extends ConsumerState<_GachaTab> {
  bool _loading = false;

  Future<void> _pull(int count) async {
    setState(() => _loading = true);
    final actionKey = 'gacha_pull';
    final key = ref.read(idempotencyKeyManagerProvider).keyFor(actionKey);
    try {
      final result = await ref.read(shopRepositoryProvider).gachaPull(count: count, idempotencyKey: key);
      ref.read(idempotencyKeyManagerProvider).reset(actionKey);
      await ref.read(myAccessoriesNotifierProvider.notifier).refresh();
      await ref.read(authNotifierProvider.notifier).refreshUser();
      if (!mounted) return;

      final catalog = ref.read(catalogNotifierProvider).value ?? [];
      final names = result.accessoryIds.map((id) {
        final match = catalog.where((a) => a.id == id);
        return match.isEmpty ? 'Item #$id' : match.first.name;
      }).join(', ');

      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Hasil Gacha'),
          content: Text('Kamu dapat: $names\n\nSisa saldo: ${result.currencyBalance} EcoPoin'),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
        ),
      );
    } on ApiException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessageFor(e))));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.casino, size: 64, color: AppColors.buttonGreenBg),
          const SizedBox(height: 16),
          const Text('Tarik gacha untuk dapat aksesoris/makanan acak!'),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _loading ? null : () => _pull(1),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.buttonGreenBg),
            child: _loading
                ? const SizedBox(
                    width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                : const Text('Tarik Gacha x1', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class _KoleksikuTab extends ConsumerWidget {
  const _KoleksikuTab();

  Future<void> _equip(BuildContext context, WidgetRef ref, UserAccessory item) async {
    try {
      await ref.read(tamagotchiNotifierProvider.notifier).equip(item.id);
      await ref.read(myAccessoriesNotifierProvider.notifier).refresh();
    } on ApiException catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessageFor(e))));
    }
  }

  Future<void> _useFood(BuildContext context, WidgetRef ref, UserAccessory item) async {
    try {
      await ref.read(tamagotchiNotifierProvider.notifier).feedItem(item.id);
      await ref.read(myAccessoriesNotifierProvider.notifier).refresh();
      if (!context.mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${item.name} dipakai, +${item.happinessValue} happiness!')));
    } on ApiException catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessageFor(e))));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myAsync = ref.watch(myAccessoriesNotifierProvider);

    return myAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, st) => Center(
        child: Text(err is ApiException ? errorMessageFor(err) : 'Gagal memuat koleksi'),
      ),
      data: (items) {
        if (items.isEmpty) {
          return const Center(child: Text('Belum punya aksesoris/makanan. Beli atau gacha dulu!'));
        }
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: items.length,
          separatorBuilder: (_, _) => const SizedBox(height: 8),
          itemBuilder: (context, i) {
            final item = items[i];
            final isFood = item.category == AccessoryCategory.food;
            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3D6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Image.network(
                    resolveMediaUrl(item.imageUrl),
                    width: 48,
                    height: 48,
                    errorBuilder: (context, error, stack) => Icon(
                      isFood ? Icons.restaurant : Icons.checkroom,
                      size: 32,
                      color: AppColors.headingNavy.withValues(alpha: 0.4),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                        Text(
                          isFood ? 'Stok: ${item.quantity}' : (item.slot?.name ?? '-'),
                          style: const TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  if (isFood)
                    ElevatedButton(
                      onPressed: item.quantity > 0 ? () => _useFood(context, ref, item) : null,
                      child: const Text('Pakai'),
                    )
                  else
                    ElevatedButton(
                      onPressed: item.isEquipped ? null : () => _equip(context, ref, item),
                      child: Text(item.isEquipped ? 'Terpasang' : 'Pasang'),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
