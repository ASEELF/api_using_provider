import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled2/features/news_feature/data/impl/news_repository_impl.dart';
import 'package:untitled2/features/news_feature/data/services/news_api_service.dart';
import 'package:untitled2/features/news_feature/presentation/providers/news_provider.dart';


final sl = GetIt.instance; 

void setupDependencies() {
  // Services
  sl.registerLazySingleton<NewsApiService>(() => NewsApiService());

  // Repositories
  sl.registerLazySingleton<NewsRepositoryImpl>(
      () => NewsRepositoryImpl(sl<NewsApiService>()));

  // Providers
  sl.registerFactory<NewsProvider>(
      () => NewsProvider(sl<NewsRepositoryImpl>()));


      final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => $initGetIt(getIt);
}
