import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_client.dart';
import 'tamagotchi_models.dart';

final tamagotchiRepositoryProvider = Provider<TamagotchiRepository>((ref) {
  return TamagotchiRepository(ref.watch(apiClientProvider));
});

class TamagotchiRepository {
  final ApiClient apiClient;
  TamagotchiRepository(this.apiClient);

  Future<Tamagotchi> getMe() async {
    final res = await apiClient.get('/tamagotchi/me');
    return Tamagotchi.fromJson(res.data as Map<String, dynamic>);
  }

  /// Aksi cepat gratis (+10 happiness tetap) — beda dari [feedItem] yang
  /// mengonsumsi makanan dari inventory (`docs/DATA_MODELS.md`).
  Future<Tamagotchi> feed() async {
    final res = await apiClient.post('/tamagotchi/me/feed');
    return Tamagotchi.fromJson(res.data as Map<String, dynamic>);
  }

  Future<Tamagotchi> feedItem(int accessoryId) async {
    final res = await apiClient.post('/tamagotchi/me/feed-item', data: {'accessory_id': accessoryId});
    return Tamagotchi.fromJson(res.data as Map<String, dynamic>);
  }

  Future<Tamagotchi> equip(int accessoryId) async {
    final res = await apiClient.post('/tamagotchi/me/equip', data: {'accessory_id': accessoryId});
    return Tamagotchi.fromJson(res.data as Map<String, dynamic>);
  }
}
