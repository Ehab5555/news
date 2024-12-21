import 'package:flutter/material.dart';
import 'package:news/home/view/screens/home_screen.dart';
import 'package:news/news/view/news_details.dart';
import 'package:news/search/view/screens/search_screen.dart';
import 'package:news/shared/app_theme.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SearchScreen.routeName: (_) => const SearchScreen(),
        NewsDetails.routeName: (_) => const NewsDetails(),
      },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
