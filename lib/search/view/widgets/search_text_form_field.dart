import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/search/view_model/cubit/search_cubit.dart';
import 'package:news/shared/app_theme.dart';

class SearchTextFormField extends StatefulWidget {
  const SearchTextFormField({super.key});

  @override
  State<SearchTextFormField> createState() => _SearchTextFormFieldState();
}

class _SearchTextFormFieldState extends State<SearchTextFormField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: 44,
      child: TextFormField(
        controller: _controller,
        autofocus: true,
        style: TextStyle(
          fontSize: 14,
          color: isDarkMode ? Colors.white : AppTheme.charcoal,
        ),
        onChanged: (value) {
          // جلب النتائج فورا أو يمكنك ربطها بـ Debouncer لتوفير الأداء
          if (value.trim().isNotEmpty) {
            context.read<SearchCubit>().newsSearch(value.trim());
          }
        },
        onFieldSubmitted: (value) {
          if (value.trim().isNotEmpty) {
            context.read<SearchCubit>().newsSearch(value.trim());
          }
        },
        decoration: InputDecoration(
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          hintText: 'Search exclusive news...',
          hintStyle: TextStyle(
            fontSize: 13,
            color: isDarkMode ? Colors.white38 : Colors.grey[500],
          ),
          fillColor: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
          filled: true,
          prefixIcon: Icon(
            Icons.search_rounded,
            size: 18,
            color: isDarkMode ? Colors.white54 : Colors.grey[600],
          ),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    _controller.clear();
                    // تفريغ نتائج البحث عند مسح النص إذا رغبت
                  },
                  icon: const Icon(Icons.clear_rounded, size: 16),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide(
              color: isDarkMode
                  ? Colors.white.withValues(alpha: 0.05)
                  : Colors.black.withValues(alpha: 0.05),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide(
              color: AppTheme.primaryColor.withValues(alpha: 0.5),
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
