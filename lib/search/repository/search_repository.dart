import 'package:news/news/data/data_source/news_data_source.dart';
import 'package:news/news/data/models/news_response/news.dart';

class SearchRepository {
  final NewsDataSource newsDataSource;
  const SearchRepository(this.newsDataSource);

  Future<List<News>> searchNews(String query) async {
    return newsDataSource.newsSearch(query);
  }
}
