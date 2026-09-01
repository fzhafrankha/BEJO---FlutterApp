import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tamagotchi_app/core/network/api_exception.dart';
import 'package:tamagotchi_app/features/chatbot/application/chatbot_notifier.dart';
import 'package:tamagotchi_app/features/chatbot/data/chatbot_models.dart';
import 'package:tamagotchi_app/features/chatbot/data/chatbot_repository.dart';

class MockChatbotRepository extends Mock implements ChatbotRepository {}

void main() {
  late MockChatbotRepository repo;
  late ProviderContainer container;

  setUp(() {
    repo = MockChatbotRepository();
    container = ProviderContainer(overrides: [chatbotRepositoryProvider.overrideWithValue(repo)]);
    addTearDown(container.dispose);
  });

  test('gagal buat sesi -> state error', () async {
    when(() => repo.createSession())
        .thenAnswer((_) async => throw ApiException('INTERNAL_ERROR', 'Kesalahan server tak terduga'));

    // Baca notifier memicu build() (auto-start session).
    container.read(chatbotNotifierProvider.notifier);
    await Future<void>.delayed(Duration.zero);

    final state = container.read(chatbotNotifierProvider);
    state.maybeWhen(error: (_) {}, orElse: () => fail('expected error state, got $state'));
  });

  test('kirim pesan sukses -> balasan assistant ditambahkan', () async {
    when(() => repo.createSession()).thenAnswer((_) async => 1);
    when(() => repo.sendMessage(1, 'halo')).thenAnswer(
      (_) async => ChatMessage(role: ChatRole.assistant, content: 'Halo juga!', time: DateTime(2026, 1, 1)),
    );

    final notifier = container.read(chatbotNotifierProvider.notifier);
    await Future<void>.delayed(Duration.zero);
    await notifier.sendMessage('halo');

    final state = container.read(chatbotNotifierProvider);
    state.maybeWhen(
      ready: (sessionId, messages, isSending, snackbarError) {
        expect(messages.length, 2);
        expect(messages[0].role, ChatRole.user);
        expect(messages[1].role, ChatRole.assistant);
        expect(messages[1].content, 'Halo juga!');
        expect(isSending, false);
      },
      orElse: () => fail('expected ready state, got $state'),
    );
  });

  test('PROMPT_GUARD_BLOCKED -> balasan chat, bukan error dialog', () async {
    when(() => repo.createSession()).thenAnswer((_) async => 1);
    when(() => repo.sendMessage(1, 'topik lain')).thenThrow(
      ApiException('PROMPT_GUARD_BLOCKED', 'Pertanyaan di luar topik 3R'),
    );

    final notifier = container.read(chatbotNotifierProvider.notifier);
    await Future<void>.delayed(Duration.zero);
    await notifier.sendMessage('topik lain');

    final state = container.read(chatbotNotifierProvider);
    state.maybeWhen(
      ready: (sessionId, messages, isSending, snackbarError) {
        expect(messages.length, 2);
        expect(messages[1].role, ChatRole.assistant);
        expect(messages[1].content, contains('topik 3R'));
        expect(snackbarError, isNull);
      },
      orElse: () => fail('expected ready state, got $state'),
    );
  });
}
