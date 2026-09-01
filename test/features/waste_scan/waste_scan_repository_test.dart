import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tamagotchi_app/core/network/api_client.dart';
import 'package:tamagotchi_app/features/waste_scan/data/waste_scan_models.dart';
import 'package:tamagotchi_app/features/waste_scan/data/waste_scan_repository.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  late MockApiClient apiClient;
  late WasteScanRepository repo;

  setUpAll(() {
    registerFallbackValue(Options());
  });

  setUp(() {
    apiClient = MockApiClient();
    repo = WasteScanRepository(apiClient);
  });

  test('submit mengirim Idempotency-Key header dan parsing response', () async {
    when(() => apiClient.post(any(), data: any(named: 'data'), options: any(named: 'options'))).thenAnswer(
      (_) async => ApiResponse({'currency_awarded': 10, 'currency_balance': 60}, null),
    );

    final result = await repo.submit(
      const WasteScanSubmitRequest(classifiedLabel: 'organik', confidence: 0.9),
      idempotencyKey: 'key-123',
    );

    expect(result.currencyAwarded, 10);
    expect(result.currencyBalance, 60);

    final captured = verify(() => apiClient.post(
          '/waste-scan/submit',
          data: captureAny(named: 'data'),
          options: captureAny(named: 'options'),
        )).captured;

    final sentData = captured[0] as Map<String, dynamic>;
    expect(sentData['classified_label'], 'organik');
    expect(sentData['confidence'], 0.9);

    final sentOptions = captured[1] as Options;
    expect(sentOptions.headers?['Idempotency-Key'], 'key-123');
  });

  test('retry dengan idempotency key yang sama tetap terkirim (bukan key baru)', () async {
    when(() => apiClient.post(any(), data: any(named: 'data'), options: any(named: 'options'))).thenAnswer(
      (_) async => ApiResponse({'currency_awarded': 10, 'currency_balance': 60}, null),
    );

    await repo.submit(
      const WasteScanSubmitRequest(classifiedLabel: 'B3'),
      idempotencyKey: 'same-key',
    );
    await repo.submit(
      const WasteScanSubmitRequest(classifiedLabel: 'B3'),
      idempotencyKey: 'same-key',
    );

    final calls = verify(() => apiClient.post(
          '/waste-scan/submit',
          data: captureAny(named: 'data'),
          options: captureAny(named: 'options'),
        )).captured;

    final firstOptions = calls[1] as Options;
    final secondOptions = calls[3] as Options;
    expect(firstOptions.headers?['Idempotency-Key'], 'same-key');
    expect(secondOptions.headers?['Idempotency-Key'], 'same-key');
  });
}
