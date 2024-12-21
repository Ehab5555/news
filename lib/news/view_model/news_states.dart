import 'package:news/news/data/models/news_response/news.dart';

abstract class NewsStates {}

class NewsInitial extends NewsStates {}

class GetNewsLoading extends NewsStates {}

class AllNewsLoaded extends NewsStates {}

class GetNewsError extends NewsStates {
  final String errorMessage;
  GetNewsError(this.errorMessage);
}

class GetNewsSuccess extends NewsStates {
  final List<News> news;
  GetNewsSuccess(this.news);
}

class NewsSearch extends NewsStates {
  final List<News> news;
  NewsSearch(this.news);
}
