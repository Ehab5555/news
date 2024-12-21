import 'package:flutter/material.dart';
import 'package:news/categories/view/categories_grid.dart';
import 'package:news/categories/view/category_details.dart';
import 'package:news/search/view/screens/search_screen.dart';
import 'package:news/home/view/widgets/home_drawer.dart';
import 'package:news/settings/view/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, SearchScreen.routeName);
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
