class NewsSource {
  final String? id;
  final String? name;

  const NewsSource({this.id, this.name});

  factory NewsSource.fromJson(Map<String, dynamic> json) => NewsSource(
        id: json['id'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
