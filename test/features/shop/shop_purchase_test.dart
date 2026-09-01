import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tamagotchi_app/core/network/api_client.dart';
import 'package:tamagotchi_app/core/network/api_exception.dart';
import 'package:tamagotchi_app/features/shop/data/shop_repository.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  late MockApiClient apiClient;
  late ShopRepository repo;

  setUpAll(() {
    registerFallbackValue(Options());
  });

  setUp(() {
    apiClient = MockApiClient();
    repo = ShopRepository(apiClient);
  });

  test('purchase gagal karena saldo tidak cukup -> ApiException INSUFFICIENT_CURRENCY', () async {
    when(() => apiClient.post(any(), data: any(named: 'data'), options: any(named: 'options')))
        .thenThrow(ApiException('INSUFFICIENT_CURRENCY', 'Koinmu tidak cukup untuk ini'));

    await expectLater(
      () => repo.purchase(1, idempotencyKey: 'k1'),
      throwsA(isA<ApiException>().having((e) => e.code, 'code', 'INSUFFICIENT_CURRENCY')),
    );
  });

  test('purchase mengirim Idempotency-Key header', () async {
    when(() => apiClient.post(any(), data: any(named: 'data'), options: any(named: 'options'))).thenAnswer(
      (_) async => ApiResponse({'accessory_id': 1, 'currency_balance': 40}, null),
    );

    final result = await repo.purchase(1, idempotencyKey: 'purchase-key');
    expect(result.accessoryId, 1);
    expect(result.currencyBalance, 40);

    final captured = verify(() => apiClient.post(
          '/shop/accessories/1/purchase',
          data: any(named: 'data'),
          options: captureAny(named: 'options'),
        )).captured;
    final options = captured.single as Options;
    expect(options.headers?['Idempotency-Key'], 'purchase-key');
  });

  test('gacha pull mengirim count dan Idempotency-Key', () async {
    when(() => apiClient.post(any(), data: any(named: 'data'), options: any(named: 'options'))).thenAnswer(
      (_) async => ApiResponse({
        'accessory_ids': [4, 4, 7],
        'currency_spent': 30,
        'currency_balance': 70,
      }, null),
    );

    final result = await repo.gachaPull(count: 3, idempotencyKey: 'gacha-key');
    expect(result.accessoryIds, [4, 4, 7]);
    expect(result.currencySpent, 30);

    final captured = verify(() => apiClient.post(
          '/shop/gacha/pull',
          data: captureAny(named: 'data'),
          options: captureAny(named: 'options'),
        )).captured;
    expect((captured[0] as Map)['count'], 3);
    expect((captured[1] as Options).headers?['Idempotency-Key'], 'gacha-key');
  });
}
