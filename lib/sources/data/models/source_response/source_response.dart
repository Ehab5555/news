import 'package:equatable/equatable.dart';

import 'source.dart';

class SourceResponse extends Equatable {
  final String? status;
  final List<Source>? sources;

  const SourceResponse({this.status, this.sources});

  factory SourceResponse.fromJson(Map<String, dynamic> json) {
    return SourceResponse(
      status: json['status'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'sources': sources?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [
        status,
        sources,
      ];
}
