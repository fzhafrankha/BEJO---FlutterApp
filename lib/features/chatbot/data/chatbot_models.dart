import 'package:freezed_annotation/freezed_annotation.dart';

part 'chatbot_models.freezed.dart';
part 'chatbot_models.g.dart';

enum ChatRole { user, assistant }

ChatRole _roleFromJson(String value) => value == 'assistant' ? ChatRole.assistant : ChatRole.user;
String _roleToJson(ChatRole role) => role.name;

/// Sumber: `backend/internal/chatbot/service.go` `MessageResponse` — SENGAJA
/// tidak punya `id` dan field waktu bernama `time` (bukan `created_at`), lihat
/// `frontend/docs/DATA_MODELS.md` §ChatMessage.
@freezed
abstract class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    @JsonKey(fromJson: _roleFromJson, toJson: _roleToJson) required ChatRole role,
    required String content,
    required DateTime time,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);
}
