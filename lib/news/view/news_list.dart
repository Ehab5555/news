import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/view/news_details.dart';
import 'package:news/news/view/news_item.dart';
import 'package:news/news/view_model/news_states.dart';
import 'package:news/news/view_model/news_view_model.dart';
import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';

class NewsList extends StatefulWidget {
  final String sourceId;
  const NewsList({super.key, required this.sourceId});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final newsViewModel = NewsViewModel();

  @override
  Widget build(BuildContext context) {
    newsViewModel.getNews(
      widget.sourceId,
    );
    return BlocProvider(
      create: (_) => newsViewModel,
      child: BlocBuilder<NewsViewModel, NewsStates>(
        builder: (_, state) {
          if (state is GetNewsLoading) {
            return const LoadingIndicator();
          } else if (state is GetNewsError) {
            return ErrorIndicator(errorMessage: state.errorMessage);
          } else if (state is GetNewsSuccess) {
            return ListView.builder(
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      NewsDetails.routeName,
                      arguments: state.news[index],
                    );
                  },
                  child: NewsItem(
                    news: state.news[index],
                  ),
                );
              },
              itemCount: state.news.length,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
