import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/error_messages.dart';
import '../data/chatbot_models.dart';
import '../data/chatbot_repository.dart';

part 'chatbot_notifier.freezed.dart';

@freezed
abstract class ChatbotState with _$ChatbotState {
  const factory ChatbotState.loading() = _Loading;
  const factory ChatbotState.error(String message) = _Error;
  const factory ChatbotState.ready({
    required int sessionId,
    required List<ChatMessage> messages,
    @Default(false) bool isSending,
    String? snackbarError,
  }) = _Ready;
}

final chatbotNotifierProvider = NotifierProvider<ChatbotNotifier, ChatbotState>(ChatbotNotifier.new);

class ChatbotNotifier extends Notifier<ChatbotState> {
  late final ChatbotRepository _repo;

  @override
  ChatbotState build() {
    _repo = ref.watch(chatbotRepositoryProvider);
    _startSession();
    return const ChatbotState.loading();
  }

  Future<void> _startSession() async {
    try {
      final sessionId = await _repo.createSession();
      state = ChatbotState.ready(sessionId: sessionId, messages: const []);
    } on ApiException catch (e) {
      state = ChatbotState.error(errorMessageFor(e));
    }
  }

  Future<void> sendMessage(String content) async {
    final trimmed = content.trim();
    if (trimmed.isEmpty) return;
    final current = state;
    if (current is! _Ready || current.isSending) return;

    final userMessage = ChatMessage(role: ChatRole.user, content: trimmed, time: DateTime.now());
    state = current.copyWith(messages: [...current.messages, userMessage], isSending: true);

    try {
      final reply = await _repo.sendMessage(current.sessionId, trimmed);
      final after = state;
      if (after is! _Ready) return;
      state = after.copyWith(messages: [...after.messages, reply], isSending: false);
    } on ApiException catch (e) {
      final after = state;
      if (after is! _Ready) return;
      if (e.code == 'PROMPT_GUARD_BLOCKED') {
        final blockedReply = ChatMessage(role: ChatRole.assistant, content: errorMessageFor(e), time: DateTime.now());
        state = after.copyWith(messages: [...after.messages, blockedReply], isSending: false);
      } else {
        state = after.copyWith(isSending: false, snackbarError: errorMessageFor(e));
      }
    }
  }

  void consumeSnackbarError() {
    final current = state;
    if (current is _Ready && current.snackbarError != null) {
      state = current.copyWith(snackbarError: null);
    }
  }

  void retry() {
    state = const ChatbotState.loading();
    _startSession();
  }
}
