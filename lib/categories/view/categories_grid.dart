import 'package:flutter/material.dart';
import 'package:news/categories/data/model/category_model.dart';

import 'package:news/categories/view/categories_item.dart';
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
  List<CategoryModel> categories = [
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
      title: 'entertainment',
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick your category of interest',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppTheme.navy,
                ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(left: 24),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
              ),
              itemBuilder: (_, index) => GestureDetector(
                onTap: () => widget.onCategorySelected(categories[index].id),
                child: CategoriesItem(
                  categoryModel: categories[index],
                  index: index,
                ),
              ),
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
