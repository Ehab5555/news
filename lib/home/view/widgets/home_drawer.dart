import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/home/view_model/cubit/theme_cubit.dart';
import 'package:news/shared/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  final void Function(DrawerItem) onDrawerItemSelected;
  final DrawerItem selectedItem; // إضافة العنصر المختار لتلوينه

  const HomeDrawer({
    super.key,
    required this.onDrawerItemSelected,
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    // استخدام watch للتحديث الفوري عند تغيير الثيم
    final themeMode = context.watch<ThemeCubit>().state;
    final isDarkMode = themeMode == ThemeMode.dark;

    // ألوان محسنة للثيم
    final backgroundColor = isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;
    final headerColor =
        isDarkMode ? const Color(0xFF2C2C2C) : AppTheme.primaryColor;
    final iconColor = isDarkMode ? Colors.white70 : AppTheme.charcoal;
    final selectedColor = AppTheme.primaryColor;

    return Drawer(
      backgroundColor: backgroundColor,
      elevation: 0, // تصميم مسطح ونظيف
      child: Column(
        children: [
          // 1️⃣ رأس الـ Drawer بتصميم فخم
          DrawerHeader(
            decoration: BoxDecoration(
              color: headerColor,
            ),
            margin: EdgeInsets.zero,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.1),
                    ),
                    child: const Icon(
                      Icons.newspaper_rounded,
                      size: 40,
                      color: AppTheme.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'EXQUISITE NEWS',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // 2️⃣ عناصر التنقل (Categories)
          _buildDrawerItem(
            context: context,
            label: 'Categories',
            icon: Icons.grid_view_rounded,
            isSelected: selectedItem == DrawerItem.categories,
            onTap: () => onDrawerItemSelected(DrawerItem.categories),
            selectedColor: selectedColor,
            iconColor: iconColor,
          ),

          // 3️⃣ عناصر التنقل (Settings)
          _buildDrawerItem(
            context: context,
            label: 'Settings',
            icon: Icons.settings_rounded,
            isSelected: selectedItem == DrawerItem.settings,
            onTap: () => onDrawerItemSelected(DrawerItem.settings),
            selectedColor: selectedColor,
            iconColor: iconColor,
          ),

          const Spacer(),
          // تذييل بسيط
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Version 1.0.0',
              style: TextStyle(
                fontSize: 10,
                color: isDarkMode ? Colors.white24 : Colors.black26,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🛠️ دالة مساعدة لبناء عنصر القائمة بتصميم عصري
  Widget _buildDrawerItem({
    required BuildContext context,
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
    required Color selectedColor,
    required Color iconColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Material(
        color: isSelected
            ? selectedColor.withValues(alpha: 0.15)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: ListTile(
            leading: Icon(
              icon,
              size: 24,
              color: isSelected ? selectedColor : iconColor,
            ),
            title: Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? selectedColor : iconColor,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            minLeadingWidth: 0,
          ),
        ),
      ),
    );
  }
}

enum DrawerItem {
  categories,
  settings,
}
