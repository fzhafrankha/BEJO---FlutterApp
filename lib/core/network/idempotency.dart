import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final idempotencyKeyManagerProvider =
    Provider<IdempotencyKeyManager>((ref) => IdempotencyKeyManager());

/// Generator+cache Idempotency-Key per aksi (`docs/ARCHITECTURE.md` §3.3).
///
/// Key digenerate sekali per [actionKey] (dipanggil di titik mulai aksi user,
/// sebelum request pertama dikirim), dipakai ulang untuk retry request yang
/// identik, lalu di-[reset] setelah aksi selesai (sukses/gagal final) supaya
/// aksi berikutnya dapat key baru — mencegah reuse key lintas aksi berbeda.
class IdempotencyKeyManager {
  static const _uuid = Uuid();
  final Map<String, String> _cache = {};

  String keyFor(String actionKey) => _cache.putIfAbsent(actionKey, () => _uuid.v4());

  void reset(String actionKey) => _cache.remove(actionKey);
}
