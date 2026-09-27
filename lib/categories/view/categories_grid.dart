import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/categories/data/model/category_model.dart';
import 'package:news/categories/view/categories_item.dart';
import 'package:news/home/view_model/cubit/theme_cubit.dart';
import 'package:news/shared/app_theme.dart';

class CategoriesGrid extends StatefulWidget {
  final void Function(String) onCategorySelected;
  const CategoriesGrid({
    super.key,
    required this.onCategorySelected,
  });

  @override
  State<CategoriesGrid> createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid> {
  final List<CategoryModel> categories = [
    CategoryModel(
      id: 'sports',
      title: 'Sports',
      imgName: 'sports',
      color: const Color(0xffC91C22),
    ),
    CategoryModel(
      id: 'business',
      title: 'Business',
      imgName: 'bussines',
      color: const Color(0xffCF7E48),
    ),
    CategoryModel(
      id: 'technology',
      title: 'Technology',
      imgName: 'Politics',
      color: const Color(0xff003E90),
    ),
    CategoryModel(
      id: 'science',
      title: 'Science',
      imgName: 'science',
      color: const Color(0xffF2D352),
    ),
    CategoryModel(
      id: 'entertainment',
      title: 'Entertainment',
      imgName: 'environment',
      color: const Color(0xff4882CF),
    ),
    CategoryModel(
      id: 'health',
      title: 'Health',
      imgName: 'health',
      color: const Color(0xffED1E79),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // استخدام watch للتحديث الفوري عند تغيير الثيم
    final isDarkMode = context.watch<ThemeCubit>().state == ThemeMode.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عنوان ترحيبي فاخر
          Text(
            'Explore Categories',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              color: isDarkMode ? AppTheme.white : AppTheme.navy,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Pick your category of interest',
            style: TextStyle(
              fontSize: 13,
              color: isDarkMode ? Colors.white54 : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 20),

          // شبكة التصنيفات
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.95, // تحسين أبعاد الكارد ليكون متناسقاً
              ),
              itemCount: categories.length,
              itemBuilder: (_, index) => GestureDetector(
                onTap: () => widget.onCategorySelected(categories[index].id),
                child: CategoriesItem(
                  categoryModel: categories[index],
                  index: index,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
