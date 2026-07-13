import 'package:equatable/equatable.dart';

import 'news.dart';

class NewsResponse extends Equatable {
  final String? status;
  final int? totalResults;
  final List<News>? news;

  const NewsResponse({this.status, this.totalResults, this.news});

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        status: json['status'] as String?,
        totalResults: json['totalResults'] as int?,
        news: (json['articles'] as List<dynamic>?)
            ?.map((e) => News.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalResults': totalResults,
        'articles': news?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [
        status,
        totalResults,
        news,
      ];
}
