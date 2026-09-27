import 'package:flutter/material.dart';

class AppTheme {
  // 🌟 لوحة ألوان معدلة لتناسب طابع Minimal Luxury
  static const Color primaryColor = Color(0xFF2E7D32); // أخضر زمردي عميق وراقي
  static const Color accentGold =
      Color(0xFFD4AF37); // لمسة فخامة ذهبية اختيارية
  static const Color lightBackground =
      Color(0xFFF9F9F9); // أبيض رمادي هادئ ومريح للعين
  static const Color darkBackground =
      Color(0xFF121212); // أسود فخم (Deep Obsidian)

  static const Color appBarDark = Color(0xFF1E1E1E);
  static const Color navy = Color(0xFF68727D);
  static const Color charcoal = Color(0xFF2C2C2C);
  static const Color white = Color(0xFFFFFFFF);

  // ☀️ الثيم الفاتح (Light Theme)
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightBackground,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
      surface: lightBackground,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: white,
      foregroundColor: charcoal,
      elevation: 0, // إزالة الظل الثقيل وجعله مسطح ونظيف (Clean Flat UI)
      centerTitle: true,
      scrolledUnderElevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24), // انحناء أصغر وأكثر حداثة
          bottomRight: Radius.circular(24),
        ),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: charcoal,
        letterSpacing: 0.5,
      ),
      titleSmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: navy,
        letterSpacing: 0.2,
      ),
    ),
  );

  // 🌙 الثيم الداكن (Dark Theme)
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBackground,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.dark,
      surface: darkBackground,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: appBarDark,
      foregroundColor: white,
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: white,
        letterSpacing: 0.5,
      ),
      titleSmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: Colors.white60,
        letterSpacing: 0.2,
      ),
    ),
  );
}
