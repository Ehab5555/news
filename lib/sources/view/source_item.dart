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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: AppTheme.primaryColor,
        ),
        color: isSelected ? AppTheme.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        source,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: isSelected ? AppTheme.white : AppTheme.primaryColor,
            ),
      ),
    );
  }
}
