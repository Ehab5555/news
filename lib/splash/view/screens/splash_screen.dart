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
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // إعداد الأنيميشن
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    // حركة التكبير والتلاشي
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
    _controller.forward();

    // الانتقال للصفحة التالية بعد وقت محدد
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
    return Container(
      decoration: BoxDecoration(
        color: context.read<ThemeCubit>().state == ThemeMode.dark
            ? AppTheme.darkPrimaryColor
            : AppTheme.white,
        image: DecorationImage(
          image: AssetImage('assets/imgs/pattern.png'),
        ),
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: ScaleTransition(
                scale: _animation,
                child: FadeTransition(
                  opacity: _animation,
                  child: Image.asset(
                    'assets/logo.png',
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                ),
              ),
            ),

            // العناصر السفلية (اللودينج والنصوص)
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  const CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF2E7D32)),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "supervised by Ehab Ahmed",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF2E7D32)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
