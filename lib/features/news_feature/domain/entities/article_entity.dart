class ArticleEntity {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String author;
  final String source;

  ArticleEntity({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.author,
    required this.source,
  });
}
