import 'package:news/sources/data/models/source_response/source.dart';

abstract class SourceDataSource {
  Future<List<Source>> getSources(String categoryId);
}
