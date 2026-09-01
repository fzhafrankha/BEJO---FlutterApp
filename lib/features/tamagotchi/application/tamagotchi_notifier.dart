import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/tamagotchi_models.dart';
import '../data/tamagotchi_repository.dart';

final tamagotchiNotifierProvider =
    AsyncNotifierProvider<TamagotchiNotifier, Tamagotchi>(TamagotchiNotifier.new);

class TamagotchiNotifier extends AsyncNotifier<Tamagotchi> {
  late final TamagotchiRepository _repo;

  @override
  Future<Tamagotchi> build() {
    _repo = ref.watch(tamagotchiRepositoryProvider);
    return _repo.getMe();
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(() => _repo.getMe());
  }

  /// Berbeda dari [refresh]/`build()`, method aksi (feed/feedItem/equip) tetap
  /// rethrow error setelah menyimpannya ke [state] — supaya screen bisa
  /// menampilkan snackbar spesifik (mis. "quantity habis") lewat try/catch,
  /// bukan cuma lewat `AsyncValue.error` di widget tree.
  Future<void> _mutate(Future<Tamagotchi> Function() action) async {
    try {
      final result = await action();
      state = AsyncData(result);
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow;
    }
  }

  Future<void> feed() => _mutate(_repo.feed);

  Future<void> feedItem(int accessoryId) => _mutate(() => _repo.feedItem(accessoryId));

  Future<void> equip(int accessoryId) => _mutate(() => _repo.equip(accessoryId));
}
