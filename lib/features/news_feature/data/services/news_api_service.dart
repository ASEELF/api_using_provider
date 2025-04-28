import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../models/article_response.dart';

class NewsApiService {
  final String apiKey = '22197779b17946ab949a78e557c07b98';

  Future<List<ArticleResponse>> fetchNews() async {
    final dio = Dio();
    final Logger logger = Logger();
    final url =
        'https://newsapi.org/v2/everything?q=tesla&from=2025-03-20&sortBy=publishedAt&apiKey=$apiKey';
    logger.i('Calling API: $url'); 

    try {
      final response = await dio.get(url);
      logger.i('✅ Response Status Code: ${response.statusCode}');
      logger.i('📰 Response Data: ${response.data}'); 
      if (response.statusCode == 200) {
        final articles = response.data['articles'] as List;
        return articles
            .map((json) => ArticleResponse.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }
}
