import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/categories/view/categories_grid.dart';
import 'package:news/categories/view/category_details.dart';
import 'package:news/home/view/widgets/home_drawer.dart';
import 'package:news/home/view_model/cubit/theme_cubit.dart';
import 'package:news/search/view/screens/search_screen.dart';
import 'package:news/settings/view/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? categoryId;
  DrawerItem drawerItem = DrawerItem.categories;

  void onDrawerItemSelected(DrawerItem item) {
    setState(() {
      drawerItem = item;
      categoryId = null;
    });
    Navigator.pop(context);
  }

  void onCategorySelected(String selectedId) {
    setState(() {
      categoryId = selectedId;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 🔙 إدارة زر الرجوع لمنع الخروج المفاجئ من التطبيق أثناء التصفح
    return PopScope(
      canPop: categoryId == null && drawerItem == DrawerItem.categories,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        setState(() {
          if (categoryId != null) {
            categoryId = null; // العودة من تفاصيل التصنيف إلى شبكة التصنيفات
          } else if (drawerItem != DrawerItem.categories) {
            drawerItem =
                DrawerItem.categories; // العودة من الإعدادات إلى التصنيفات
          }
        });
      },
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          final isDarkMode = state == ThemeMode.dark;

          return Scaffold(
            backgroundColor:
                isDarkMode ? const Color(0xFF121212) : const Color(0xFFF9F9F9),
            appBar: AppBar(
              title: Text(
                categoryId != null
                    ? 'Category Details'
                    : (drawerItem == DrawerItem.categories
                        ? 'News Categories'
                        : 'Settings'),
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SearchScreen.routeName);
                  },
                  icon: const Icon(Icons.search_rounded),
                  splashRadius: 24,
                ),
                const SizedBox(width: 8),
              ],
            ),
            body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: categoryId != null
                  ? CategoryDetails(categoryId: categoryId!)
                  : drawerItem == DrawerItem.categories
                      ? CategoriesGrid(onCategorySelected: onCategorySelected)
                      : const SettingsTab(),
            ),
            drawer: Drawer(
              backgroundColor:
                  isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
              child: HomeDrawer(
                onDrawerItemSelected: onDrawerItemSelected,
                selectedItem: drawerItem,
              ),
            ),
          );
        },
      ),
    );
  }
}
