import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/theme/color_manager.dart';
import 'package:untitled2/core/widgets/custom_error_widget.dart';
import 'package:untitled2/core/widgets/custom_loading_widget.dart';
import 'package:untitled2/features/news_feature/domain/entities/article_entity.dart';
import '../providers/news_provider.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tesla News'),
        backgroundColor: ColorManager.primary,
        elevation: 0,
      ),
      body: Consumer<NewsProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const CustomLoadingWidget();
          }
          if (provider.error != null) {
            return CustomErrorWidget(
              errorMessage: provider.error!,
              onRetry: () => provider.loadNews(),
            );
          }
          return ListView.builder(
            itemCount: provider.articles.length,
            itemBuilder: (context, index) {
              ArticleEntity article = provider.articles[index];

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 8,
                shadowColor: ColorManager.backgroundDark,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.backgroundDark,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        article.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16, color: ColorManager.backgroundDark),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.source, size: 16, color: ColorManager.textSecondary),
                          const SizedBox(width: 5),
                          Text(
                            article.source,
                            style: const TextStyle(fontSize: 14, color: ColorManager.textSecondary),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Author: ${article.author} | Published on: ${article.publishedAt}',
                        style: const TextStyle(fontSize: 12, color: ColorManager.textSecondary),
                      ),
                      const SizedBox(height: 12),
                      InkWell(
                        onTap: () {
                          log('Open URL: ${article.url}');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.read_more, color: ColorManager.primary, size: 18),
                            const SizedBox(width: 5),
                            Text(
                              'Read more...',
                              style: const TextStyle(
                                color: ColorManager.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
