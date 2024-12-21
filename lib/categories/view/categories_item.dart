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
    return Container(
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
          bottomRight: Radius.circular(index % 2 == 0 ? 0 : 25),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 4,
        children: <Widget>[
          Image.asset(
            'assets/imgs/${categoryModel.imgName}.png',
            height: MediaQuery.sizeOf(context).height * 0.12,
          ),
          Text(
            categoryModel.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppTheme.white,
                ),
          ),
        ],
      ),
    );
  }
}
