import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/shop_models.dart';
import '../data/shop_repository.dart';

final catalogNotifierProvider =
    AsyncNotifierProvider<CatalogNotifier, List<Accessory>>(CatalogNotifier.new);

class CatalogNotifier extends AsyncNotifier<List<Accessory>> {
  late final ShopRepository _repo;

  @override
  Future<List<Accessory>> build() {
    _repo = ref.watch(shopRepositoryProvider);
    return _repo.listAccessories();
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(() => _repo.listAccessories());
  }
}

final myAccessoriesNotifierProvider =
    AsyncNotifierProvider<MyAccessoriesNotifier, List<UserAccessory>>(MyAccessoriesNotifier.new);

class MyAccessoriesNotifier extends AsyncNotifier<List<UserAccessory>> {
  late final ShopRepository _repo;

  @override
  Future<List<UserAccessory>> build() {
    _repo = ref.watch(shopRepositoryProvider);
    return _repo.myAccessories();
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(() => _repo.myAccessories());
  }
}
