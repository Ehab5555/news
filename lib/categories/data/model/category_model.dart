import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CategoryModel extends Equatable {
  final String id;
  final String title;
  final String imgName;
  final Color color;

  const CategoryModel({
    required this.id,
    required this.title,
    required this.imgName,
    required this.color,
  });

  @override
  List<Object?> get props => [id, title, imgName, color];
}
