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
  late final NewsViewModel _newsViewModel;

  @override
  void initState() {
    super.initState();
    _newsViewModel = NewsViewModel();
    // جلب البيانات مرة واحدة فقط عند إنشاء الـ State
    _newsViewModel.getNews(widget.sourceId);
  }

  @override
  void didUpdateWidget(covariant NewsList oldWidget) {
    super.didUpdateWidget(oldWidget);
    // جلب البيانات مجدداً فقط إذا تغيرت المصادر (Source ID)
    if (oldWidget.sourceId != widget.sourceId) {
      _newsViewModel.getNews(widget.sourceId);
    }
  }

  @override
  void dispose() {
    _newsViewModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _newsViewModel,
      child: BlocBuilder<NewsViewModel, NewsStates>(
        builder: (context, state) {
          if (state is GetNewsLoading) {
            return const Center(child: LoadingIndicator());
          } else if (state is GetNewsError) {
            return Center(
                child: ErrorIndicator(errorMessage: state.errorMessage));
          } else if (state is GetNewsSuccess) {
            if (state.news.isEmpty) {
              return const Center(
                child: Text(
                  'No articles found for this source.',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
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
                  child: NewsItem(
                    news: article,
                  ),
                );
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
