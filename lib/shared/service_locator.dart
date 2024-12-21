import 'package:news/news/data/data_source/news_api_data_source.dart';
import 'package:news/news/data/data_source/news_data_source.dart';
import 'package:news/sources/data/data_source/source_data_source.dart';
import 'package:news/sources/data/data_source/sources_api_data_source.dart';

class ServiceLocator {
  static final SourceDataSource sourcesDataSource = SourcesAPIDataSource();
  static final NewsDataSource newsDataSource = NewsApiDataSource();
}
