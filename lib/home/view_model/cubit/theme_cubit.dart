import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  static const String theme = 'isDarkMode';

  ThemeCubit() : super(ThemeMode.dark) {
    _loadTheme();
  }

  void toggleTheme() async {
    final pref = await SharedPreferences.getInstance();

    if (state == ThemeMode.light) {
      emit(ThemeMode.dark);
      await pref.setBool('theme', true);
    } else {
      emit(ThemeMode.light);
      await pref.setBool('theme', false);
    }
  }

  void _loadTheme() async {
    final pref = await SharedPreferences.getInstance();
    final isDark = pref.getBool('theme') ?? false;
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}
