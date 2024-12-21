import 'dart:convert';

import 'package:news/shared/api_constants.dart';
import 'package:news/sources/data/data_source/source_data_source.dart';
import 'package:news/sources/data/models/source_response/source.dart';
import 'package:http/http.dart' as http;
import 'package:news/sources/data/models/source_response/source_response.dart';

class SourcesAPIDataSource extends SourceDataSource {
  @override
  Future<List<Source>> getSources(
    String categoryId,
  ) async {
    final uri = Uri.https(ApiConstants.baseURL, ApiConstants.sourceEndPoint, {
      'category': categoryId,
      'apiKey': ApiConstants.apiKey,
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final sourceResponse = SourceResponse.fromJson(json);
    if (sourceResponse.status == 'ok' && sourceResponse.sources != null) {
      return sourceResponse.sources!;
    } else {
      throw Exception('Failed to fetch sources');
    }
  }
}
