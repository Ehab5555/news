import 'package:flutter/material.dart';
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
    return Column(
      spacing: 24,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.2,
          color: AppTheme.primaryColor,
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
                    Icon(
                      Icons.list_outlined,
                      size: 30,
                    ),
                    Text(
                      'Categories',
                      style: textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => onDrawerItemSelected(DrawerItem.settings),
                child: Row(
                  spacing: 6,
                  children: [
                    Icon(
                      Icons.settings,
                      size: 30,
                    ),
                    Text(
                      'Settings',
                      style: textTheme.titleLarge,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

enum DrawerItem {
  categories,
  settings,
}
