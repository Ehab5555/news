import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/home/view/screens/home_screen.dart';
import 'package:news/home/view_model/cubit/theme_cubit.dart';
import 'package:news/shared/app_theme.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutExpo,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.8, curve: Curves.easeIn),
    );

    _controller.forward();

    // ⏱️ الانتقال التلقائي لشاشة الـ Home بعد 3 ثوانٍ
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeCubit>().state == ThemeMode.dark;

    // خلفية متناسقة وفاخرة تعتمد على الـ Theme الحالي
    final backgroundColor =
        isDarkMode ? const Color(0xFF121212) : const Color(0xFFF9F9F9);
    final primaryTextColor = isDarkMode ? Colors.white : AppTheme.navy;
    final accentColor = AppTheme.primaryColor; // اللون الأساسي للتطبيق

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            // 1️⃣ إضاءة خلفية ناعمة (Ambient Glow) متكيفة مع الثيم
            Center(
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      accentColor.withValues(alpha: isDarkMode ? 0.08 : 0.04),
                  boxShadow: [
                    BoxShadow(
                      color: accentColor.withValues(
                          alpha: isDarkMode ? 0.12 : 0.06),
                      blurRadius: 100,
                      spreadRadius: 40,
                    ),
                  ],
                ),
              ),
            ),

            // 2️⃣ الشعار التيبوغرافي الفاخر والعلامة التجارية
            Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // أيقونة دائرية بتصميم زجاجيMinimal
                      Container(
                        padding: const EdgeInsets.all(28),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isDarkMode
                              ? const Color(0xFF1E1E1E)
                              : Colors.white,
                          border: Border.all(
                            color: isDarkMode
                                ? Colors.white.withValues(alpha: 0.08)
                                : Colors.black.withValues(alpha: 0.06),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withValues(alpha: isDarkMode ? 0.4 : 0.06),
                              blurRadius: 25,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.newspaper_rounded,
                          size: 48,
                          color: accentColor,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // اسم التطبيق بخط عصري واسع المسافات (LetterSpacing)
                      Text(
                        "EXQUISITE NEWS",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4.0,
                          color: primaryTextColor,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // شعار فرعي خفيف
                      Text(
                        "YOUR DAILY BRIEFING",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2.0,
                          color: isDarkMode ? Colors.white38 : Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // 3️⃣ المؤشر السفلي وتوقيع الإشراف
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 1.5,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          accentColor.withValues(alpha: 0.8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "SUPERVISED BY EHAB ELISH",
                      style: TextStyle(
                        fontSize: 9,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w500,
                        color: isDarkMode ? Colors.white24 : Colors.black38,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
