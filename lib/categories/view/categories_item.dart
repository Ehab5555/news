import 'package:flutter/material.dart';
import 'package:news/categories/data/model/category_model.dart';
import 'package:news/shared/app_theme.dart';

class CategoriesItem extends StatelessWidget {
  final int index;
  final CategoryModel categoryModel;
  const CategoriesItem({
    super.key,
    required this.categoryModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        // خلفية أنيقة تتكيف مع الثيم بدلاً من اللون السادة الفاقع
        color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDarkMode
              ? Colors.white.withValues(alpha: 0.05)
              : Colors.black.withValues(alpha: 0.04),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDarkMode ? 0.3 : 0.04),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            // تدرج لوني خفيف وخلفية دائرية تابعة للثيم الخاص بالتصنيف في الخلفية
            Positioned(
              right: -20,
              bottom: -20,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: categoryModel.color
                      .withValues(alpha: isDarkMode ? 0.15 : 0.08),
                ),
              ),
            ),

            // محتوى البطاقة
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 🖼️ الأيقونة بتصميم نقي
                  Hero(
                    tag: categoryModel.id,
                    child: Image.asset(
                      'assets/imgs/${categoryModel.imgName}.png',
                      height: MediaQuery.sizeOf(context).height * 0.09,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 🏷️ عنوان التصنيف بلون متناسق مع شارة ملونة بسيطة
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: categoryModel.color,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        categoryModel.title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode ? Colors.white : AppTheme.charcoal,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
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
