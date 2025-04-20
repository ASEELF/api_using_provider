import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/di/injector.dart';
import 'package:untitled2/features/presentation/providers/news_provider.dart';
import 'package:untitled2/features/presentation/screens/news_screen.dart';

void main() {
   setupDependencies(); 
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

