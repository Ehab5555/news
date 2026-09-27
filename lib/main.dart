import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/home/view/screens/home_screen.dart';
import 'package:news/home/view_model/cubit/theme_cubit.dart';
import 'package:news/news/view/news_details.dart';
import 'package:news/search/view/screens/search_screen.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/splash/view/screens/splash_screen.dart';

void main() {
  // ضمان تهيئة عناصر فلاتر قبل تشغيل التطبيق إن احتجت مستقبلاً (مثل SharedPreferences)
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Exquisite News',
            // إعدادات الثيم
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            // المسارات الأساسية للتطبيق
            initialRoute: SplashScreen.routeName,
            routes: {
              SplashScreen.routeName: (_) => const SplashScreen(),
              HomeScreen.routeName: (_) => const HomeScreen(),
              SearchScreen.routeName: (_) => const SearchScreen(),
              NewsDetails.routeName: (_) => const NewsDetails(),
            },
          );
        },
      ),
    );
  }
}
