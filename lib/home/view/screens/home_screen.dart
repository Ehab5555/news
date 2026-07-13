import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/categories/view/categories_grid.dart';
import 'package:news/categories/view/category_details.dart';
import 'package:news/home/view_model/cubit/theme_cubit.dart';
import 'package:news/search/view/screens/search_screen.dart';
import 'package:news/home/view/widgets/home_drawer.dart';
import 'package:news/settings/view/settings_tab.dart';
import 'package:news/shared/app_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: state == ThemeMode.dark
                ? AppTheme.darkPrimaryColor
                : AppTheme.white,
            image: DecorationImage(
              image: AssetImage('assets/imgs/pattern.png'),
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              title: Text('News App'),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SearchScreen.routeName);
                  },
                  icon: Icon(
                    Icons.search,
                  ),
                ),
              ],
            ),
            body: categoryId != null
                ? CategoryDetails(
                    categoryId: categoryId!,
                  )
                : drawerItem == DrawerItem.categories
                    ? CategoriesGrid(
                        onCategorySelected: onCategorySelected,
                      )
                    : const SettingsTab(),
            drawer: Drawer(
              child: HomeDrawer(
                onDrawerItemSelected: onDrawerItemSelected,
              ),
            ),
          ),
        );
      },
    );
  }

  String? categoryId;
  DrawerItem drawerItem = DrawerItem.categories;
  void onDrawerItemSelected(DrawerItem item) {
    drawerItem = item;
    categoryId = null;
    Navigator.pop(context);
    setState(() {});
  }

  void onCategorySelected(String categoryId) {
    this.categoryId = categoryId;
    setState(() {});
  }
}
