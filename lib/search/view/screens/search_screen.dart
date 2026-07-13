import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/home/view_model/cubit/theme_cubit.dart';
import 'package:news/search/view_model/cubit/search_cubit.dart';
import 'package:news/search/view/widgets/search_list_news.dart';
import 'package:news/search/view/widgets/search_text_form_field.dart';
import 'package:news/shared/app_theme.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'search';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Container(
        decoration: BoxDecoration(
          color: context.read<ThemeCubit>().state == ThemeMode.dark
              ? AppTheme.darkPrimaryColor
              : AppTheme.white,
          image: DecorationImage(
            image: AssetImage('assets/imgs/pattern.png'),
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: SearchTextFormField(),
          ),
          body: SearchListNews(),
        ),
      ),
    );
  }
}
