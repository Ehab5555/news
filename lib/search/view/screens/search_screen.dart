import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/view_model/news_view_model.dart';

import 'package:news/search/view/widgets/search_list_news.dart';
import 'package:news/search/view/widgets/search_text_form_field.dart';

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
      create: (context) => NewsViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: SearchTextFormField(),
        ),
        body: SearchListNews(),
      ),
    );
  }
}
