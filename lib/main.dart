import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/di/configure_dependencies.dart';
import 'package:untitled2/core/di/setup_dependencies.dart';
import 'package:untitled2/features/news_feature/presentation/providers/news_provider.dart';
import 'package:untitled2/features/news_feature/presentation/screens/news_screen.dart';

void main() async{
   await configureDependencies(); 
  setupDependencies(); 
  //  setupDependencies(); 
 runApp(
    ChangeNotifierProvider(
      create: (_) => sl<NewsProvider>()..loadNews(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: NewsScreen(), 
    );
  }
}

