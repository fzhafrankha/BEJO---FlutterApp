import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_client.dart';
import 'chatbot_models.dart';

final chatbotRepositoryProvider = Provider<ChatbotRepository>((ref) {
  return ChatbotRepository(ref.watch(apiClientProvider));
});

class ChatbotRepository {
  final ApiClient apiClient;
  ChatbotRepository(this.apiClient);

  Future<int> createSession() async {
    final res = await apiClient.post('/chatbot/sessions');
    return (res.data as Map<String, dynamic>)['session_id'] as int;
  }

  Future<List<ChatMessage>> getMessages(int sessionId) async {
    final res = await apiClient.get('/chatbot/sessions/$sessionId/messages');
    return (res.data as List).map((e) => ChatMessage.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// `PROMPT_GUARD_BLOCKED` dilempar sebagai [ApiException] biasa oleh
  /// [ApiClient] — ditangani notifier sebagai balasan chat, bukan error dialog.
  Future<ChatMessage> sendMessage(int sessionId, String content) async {
    final res = await apiClient.post('/chatbot/sessions/$sessionId/messages', data: {'content': content});
    return ChatMessage.fromJson(res.data as Map<String, dynamic>);
  }
}
