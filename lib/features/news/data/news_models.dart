import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_models.freezed.dart';
part 'news_models.g.dart';

/// Sumber: `GET /news` (`backend/internal/news/service.go` `ItemResponse`).
@freezed
abstract class NewsItem with _$NewsItem {
  const factory NewsItem({
    required int id,
    required String title,
    required String url,
    @JsonKey(name: 'image_url') required String imageUrl,
    required String source,
    @JsonKey(name: 'published_at') required DateTime publishedAt,
  }) = _NewsItem;

  factory NewsItem.fromJson(Map<String, dynamic> json) => _$NewsItemFromJson(json);
}
