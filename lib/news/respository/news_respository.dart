import 'package:news/news/data/data_source/news_data_source.dart';
import 'package:news/news/data/models/news_response/news.dart';

class NewsRespository {
  final NewsDataSource newsDataSource;

  const NewsRespository(this.newsDataSource);

  Future<List<News>> getNews(String sourceId) async {
    return newsDataSource.getNews(sourceId);
  }

  Future<List<News>> newsSearch(String keyword) async {
    return newsDataSource.newsSearch(keyword);
  }
}
