import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/news/data/models/news_response/news.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'newsDetails';
  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final news = ModalRoute.settingsOf(context)!.arguments as News;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(news.author ?? 'Unknown'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          spacing: 24,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: [
                CachedNetworkImage(
                  imageUrl: news.urlToImage!,
                  height: MediaQuery.sizeOf(context).height * 0.25,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  placeholder: (_, __) => const LoadingIndicator(),
                  errorWidget: (_, __, ___) => const Icon(
                    Icons.image_not_supported_outlined,
                    size: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    news.author ?? '',
                    style: textTheme.titleSmall?.copyWith(fontSize: 10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    news.title ?? '',
                    style: textTheme.titleSmall,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      timeago.format(news.publishedAt ?? DateTime.now()),
                      style: textTheme.titleSmall?.copyWith(fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: Column(
                children: [
                  Text(
                    news.content ?? '',
                    style: textTheme.titleSmall,
                  ),
                  Text(
                    news.description ?? '',
                    style: textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: GestureDetector(
                  onTap: () async {
                    final Uri url = Uri.parse(news.url ?? '');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'View Full Article',
                        style: textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.forward_outlined)
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
