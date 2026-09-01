import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_content.freezed.dart';
part 'chapter_content.g.dart';

/// Materi lokal `assets/chapters/chapter_<id>.json` — bukan dari API
/// (`docs/ARCHITECTURE.md` §5). `id` wajib sama dengan `Chapter.id` backend.
@freezed
abstract class ChapterContent with _$ChapterContent {
  const factory ChapterContent({
    required int id,
    required String title,
    required List<ChapterSection> sections,
    @Default([]) List<String> imageAssets,
  }) = _ChapterContent;

  factory ChapterContent.fromJson(Map<String, dynamic> json) => _$ChapterContentFromJson(json);
}

@freezed
abstract class ChapterSection with _$ChapterSection {
  const factory ChapterSection({
    required String heading,
    required String body,
  }) = _ChapterSection;

  factory ChapterSection.fromJson(Map<String, dynamic> json) => _$ChapterSectionFromJson(json);
}
