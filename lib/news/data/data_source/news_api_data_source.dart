import 'dart:convert';
import 'package:news/news/data/data_source/news_data_source.dart';
import 'package:news/news/data/models/news_response/news.dart';
import 'package:news/news/data/models/news_response/news_response.dart';
import 'package:news/shared/api_constants.dart';
import 'package:http/http.dart' as http;

class NewsApiDataSource extends NewsDataSource {
  @override
  Future<List<News>> getNews(String sourceId) async {
    final uri = Uri.https(ApiConstants.baseURL, ApiConstants.newsEndPoint, {
      'sources': sourceId,
      'apiKey': ApiConstants.apiKey,
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final newsResponse = NewsResponse.fromJson(json);

    if (newsResponse.status == 'ok' && newsResponse.news != null) {
      return newsResponse.news!;
    } else {
      throw Exception('Failed to fetch news');
    }
  }

  @override
  Future<List<News>> newsSearch(String keyword) async {
    final uri = Uri.https(ApiConstants.baseURL, ApiConstants.newsEndPoint, {
      'q': keyword,
      'apiKey': ApiConstants.apiKey,
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final newsResponse = NewsResponse.fromJson(json);
    if (newsResponse.status == 'ok' &&
        newsResponse.news != null &&
        newsResponse.news!.isNotEmpty) {
      return newsResponse.news!;
    } else {
      throw Exception('No news found');
    }
  }
}
