import 'package:news/sources/data/data_source/source_data_source.dart';
import 'package:news/sources/data/models/source_response/source.dart';

class SourcesRespository {
  final SourceDataSource sourceDataSource;

  SourcesRespository(this.sourceDataSource);

  Future<List<Source>> getSources(String categoryId) async {
    return sourceDataSource.getSources(categoryId);
  }
}
