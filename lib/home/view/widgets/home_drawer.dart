import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/home/view_model/cubit/theme_cubit.dart';
import 'package:news/shared/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  final void Function(DrawerItem) onDrawerItemSelected;
  const HomeDrawer({
    super.key,
    required this.onDrawerItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ThemeMode theme = context.read<ThemeCubit>().state;
    Color colorTheme =
        theme == ThemeMode.dark ? AppTheme.white : AppTheme.black;
    return Container(
      decoration: BoxDecoration(
          color: theme == ThemeMode.dark
              ? AppTheme.darkPrimaryColor
              : AppTheme.white,
          image: DecorationImage(image: AssetImage('assets/imgs/pattern.png'))),
      child: Column(
        spacing: 24,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.2,
            color: theme == ThemeMode.dark
                ? AppTheme.black
                : AppTheme.primaryColor,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'News App!',
              style: textTheme.titleLarge?.copyWith(
                color: AppTheme.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              spacing: 12,
              children: [
                InkWell(
                  onTap: () => onDrawerItemSelected(DrawerItem.categories),
                  child: Row(
                    spacing: 6,
                    children: [
                      Icon(Icons.list_outlined, size: 30, color: colorTheme),
                      Text(
                        'Categories',
                        style:
                            textTheme.titleLarge?.copyWith(color: colorTheme),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => onDrawerItemSelected(DrawerItem.settings),
                  child: Row(
                    spacing: 6,
                    children: [
                      Icon(Icons.settings, size: 30, color: colorTheme),
                      Text(
                        'Settings',
                        style:
                            textTheme.titleLarge?.copyWith(color: colorTheme),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum DrawerItem {
  categories,
  settings,
}
