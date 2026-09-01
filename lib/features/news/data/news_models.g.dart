// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsItem _$NewsItemFromJson(Map<String, dynamic> json) => _NewsItem(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  url: json['url'] as String,
  imageUrl: json['image_url'] as String,
  source: json['source'] as String,
  publishedAt: DateTime.parse(json['published_at'] as String),
);

Map<String, dynamic> _$NewsItemToJson(_NewsItem instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'url': instance.url,
  'image_url': instance.imageUrl,
  'source': instance.source,
  'published_at': instance.publishedAt.toIso8601String(),
};
