import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/view/news_details.dart';
import 'package:news/news/view/news_item.dart';
import 'package:news/news/view_model/news_states.dart';
import 'package:news/news/view_model/news_view_model.dart';

import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';

class SearchListNews extends StatefulWidget {
  const SearchListNews({super.key});

  @override
  State<SearchListNews> createState() => _SearchListNewsState();
}

class _SearchListNewsState extends State<SearchListNews> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<NewsViewModel>(context),
      builder: (context, state) {
        if (state is GetNewsLoading) {
          return const LoadingIndicator();
        } else if (state is GetNewsError) {
          return ErrorIndicator(errorMessage: state.errorMessage);
        } else if (state is NewsSearch) {
          if (state.news.length == 1) {
            return NewsItem(news: state.news[0]);
          }
          return ListView.builder(
            itemBuilder: (_, index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  NewsDetails.routeName,
                  arguments: state.news[index],
                );
              },
              child: NewsItem(news: state.news[index]),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
