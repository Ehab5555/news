import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/view/news_details.dart';
import 'package:news/news/view/news_item.dart';
import 'package:news/search/view_model/cubit/search_cubit.dart';
import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';

class SearchListNews extends StatelessWidget {
  const SearchListNews({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: LoadingIndicator());
        } else if (state is SearchError) {
          return Center(child: ErrorIndicator(errorMessage: state.message));
        } else if (state is SearchSuccess) {
          if (state.news.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off_rounded,
                    size: 48,
                    color: isDarkMode ? Colors.white38 : Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No articles found',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: isDarkMode ? Colors.white54 : Colors.grey[600],
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: state.news.length,
            itemBuilder: (context, index) {
              final article = state.news[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    NewsDetails.routeName,
                    arguments: article,
                  );
                },
                child: NewsItem(news: article),
              );
            },
          );
        } else {
          // الحالة الافتراضية قبل بدء البحث (Initial State)
          return Center(
            child: Text(
              'Type something to start searching...',
              style: TextStyle(
                fontSize: 14,
                color: isDarkMode ? Colors.white38 : Colors.grey[500],
              ),
            ),
          );
        }
      },
    );
  }
}
