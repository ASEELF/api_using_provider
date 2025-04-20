import 'package:untitled2/features/data/services/news_api_service.dart';

import '../../domain/entities/article_entity.dart';
import '../../domain/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsApiService apiService;

  NewsRepositoryImpl(this.apiService);

  @override
  Future<List<ArticleEntity>> getNews() async {
    final rawList = await apiService.fetchNews();
    return rawList.map((response) => response.toEntity()).toList();
  }
}
