// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChapterContent _$ChapterContentFromJson(Map<String, dynamic> json) =>
    _ChapterContent(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      sections: (json['sections'] as List<dynamic>)
          .map((e) => ChapterSection.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageAssets:
          (json['imageAssets'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ChapterContentToJson(_ChapterContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'sections': instance.sections,
      'imageAssets': instance.imageAssets,
    };

_ChapterSection _$ChapterSectionFromJson(Map<String, dynamic> json) =>
    _ChapterSection(
      heading: json['heading'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$ChapterSectionToJson(_ChapterSection instance) =>
    <String, dynamic>{'heading': instance.heading, 'body': instance.body};
