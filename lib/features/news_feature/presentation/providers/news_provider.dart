import 'package:flutter/material.dart';
import '../../domain/entities/article_entity.dart';
import '../../domain/repository/news_repository.dart';

class NewsProvider with ChangeNotifier {
  final NewsRepository repository;

  NewsProvider(this.repository);

  List<ArticleEntity> _articles = [];
  bool _isLoading = false;
  String? _error;

  List<ArticleEntity> get articles => _articles;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadNews() async {
    _isLoading = true;
    notifyListeners();

    try {
      _articles = await repository.getNews();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
