import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/home/view_model/cubit/theme_cubit.dart';
import 'package:news/search/view/widgets/search_list_news.dart';
import 'package:news/search/view/widgets/search_text_form_field.dart';
import 'package:news/search/view_model/cubit/search_cubit.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'search';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    // استخدام watch للتعرف الفوري على حالة الثيم
    final isDarkMode = context.watch<ThemeCubit>().state == ThemeMode.dark;

    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        backgroundColor:
            isDarkMode ? const Color(0xFF121212) : const Color(0xFFF9F9F9),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          // جعل حقل البحث هو العنوان ليظهر بشكل عصري وانسيابي
          title: const SearchTextFormField(),
        ),
        body: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: SearchListNews(),
        ),
      ),
    );
  }
}
