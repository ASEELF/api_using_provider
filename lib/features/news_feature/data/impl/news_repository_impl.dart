import 'package:untitled2/features/news_feature/data/services/news_api_service.dart';
import 'package:untitled2/features/news_feature/domain/entities/article_entity.dart';
import 'package:untitled2/features/news_feature/domain/repositories/news_repositories.dart';


class NewsRepositoryImpl implements NewsRepository {
  final NewsApiService apiService;

  NewsRepositoryImpl(this.apiService);

  @override
  Future<List<ArticleEntity>> getNews() async {
    final rawList = await apiService.fetchNews();
    return rawList.map((response) => response.toEntity()).toList();
  }
}
