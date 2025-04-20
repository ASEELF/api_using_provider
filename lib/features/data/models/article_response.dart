import 'package:untitled2/features/domain/entities/article_entity.dart';


class ArticleResponse {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String author;
  final String source;

  ArticleResponse({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.author,
    required this.source,
  });

  factory ArticleResponse.fromJson(Map<String, dynamic> json) {
    return ArticleResponse(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      author: json['author'] ?? '',
      source: json['source']?['name'] ?? '',
    );
  }

  ArticleEntity toEntity() {
    return ArticleEntity(
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      author: author,
      source: source,
    );
  }
}
