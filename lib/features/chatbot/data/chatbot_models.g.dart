// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatbot_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => _ChatMessage(
  role: _roleFromJson(json['role'] as String),
  content: json['content'] as String,
  time: DateTime.parse(json['time'] as String),
);

Map<String, dynamic> _$ChatMessageToJson(_ChatMessage instance) =>
    <String, dynamic>{
      'role': _roleToJson(instance.role),
      'content': instance.content,
      'time': instance.time.toIso8601String(),
    };
