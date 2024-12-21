import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/news/data/models/news_response/news.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  final News news;
  const NewsItem({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        spacing: 6,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              height: MediaQuery.sizeOf(context).height * 0.25,
              width: double.infinity,
              fit: BoxFit.fill,
              placeholder: (_, __) => const LoadingIndicator(),
              errorWidget: (_, __, ___) => const Icon(
                Icons.image_not_supported_outlined,
                size: 50,
              ),
            ),
          ),
          Text(
            news.author ?? '',
            style: textTheme.titleSmall?.copyWith(fontSize: 10),
          ),
          Text(
            news.title ?? '',
            style: textTheme.titleSmall,
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              timeago.format(news.publishedAt ?? DateTime.now()),
              style: textTheme.titleSmall?.copyWith(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
