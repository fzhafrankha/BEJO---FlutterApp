import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_client.dart';
import 'shop_models.dart';

final shopRepositoryProvider = Provider<ShopRepository>((ref) {
  return ShopRepository(ref.watch(apiClientProvider));
});

class ShopRepository {
  final ApiClient apiClient;
  ShopRepository(this.apiClient);

  Future<List<Accessory>> listAccessories() async {
    final res = await apiClient.get('/shop/accessories');
    return (res.data as List).map((e) => Accessory.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<List<UserAccessory>> myAccessories() async {
    final res = await apiClient.get('/shop/my-accessories');
    return (res.data as List).map((e) => UserAccessory.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<PurchaseResult> purchase(int accessoryId, {required String idempotencyKey}) async {
    final res = await apiClient.post(
      '/shop/accessories/$accessoryId/purchase',
      options: Options(headers: {'Idempotency-Key': idempotencyKey}),
    );
    return PurchaseResult.fromJson(res.data as Map<String, dynamic>);
  }

  Future<GachaResult> gachaPull({int count = 1, required String idempotencyKey}) async {
    final res = await apiClient.post(
      '/shop/gacha/pull',
      data: {'count': count},
      options: Options(headers: {'Idempotency-Key': idempotencyKey}),
    );
    return GachaResult.fromJson(res.data as Map<String, dynamic>);
  }
}
