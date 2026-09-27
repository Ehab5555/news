import 'package:flutter/material.dart';
import 'package:news/shared/app_theme.dart';

class SourceItem extends StatelessWidget {
  final String source;
  final bool isSelected;
  const SourceItem({
    super.key,
    required this.source,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected
            ? AppTheme.primaryColor
            : (isDarkMode ? const Color(0xFF1E1E1E) : Colors.white),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          width: 1, // تم تقليل السمك ليكون أرقى
          color: isSelected
              ? Colors.transparent
              : AppTheme.primaryColor.withValues(alpha: 0.3),
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: AppTheme.primaryColor.withValues(alpha: 0.25),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: Text(
        source,
        style: TextStyle(
          fontSize: 13,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          color: isSelected
              ? AppTheme.white
              : (isDarkMode ? Colors.white70 : AppTheme.primaryColor),
        ),
      ),
    );
  }
}
