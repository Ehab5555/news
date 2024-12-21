import 'package:news/news/data/models/news_response/news.dart';

abstract class NewsDataSource {
  Future<List<News>> getNews(String sourceId);
  Future<List<News>> newsSearch(String keyword);
}
