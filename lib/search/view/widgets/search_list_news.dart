import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/view/news_details.dart';
import 'package:news/news/view/news_item.dart';
import 'package:news/search/view_model/cubit/search_cubit.dart';
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
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const LoadingIndicator();
        } else if (state is SearchError) {
          return ErrorIndicator(errorMessage: state.message);
        } else if (state is SearchSuccess) {
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
            itemCount: state.news.length,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
