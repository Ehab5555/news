import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/home/view_model/cubit/theme_cubit.dart';
import 'package:news/news/data/models/news_response/news.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'newsDetails';
  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final news = ModalRoute.of(context)!.settings.arguments as News;
    final isDarkMode = context.watch<ThemeCubit>().state == ThemeMode.dark;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor:
          isDarkMode ? const Color(0xFF121212) : const Color(0xFFF9F9F9),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          news.author ?? 'Article Details',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🖼️ صورة الخبر البارزة بتصميم فاخر
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? '',
                height: MediaQuery.sizeOf(context).height * 0.3,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (_, __) => const SizedBox(
                  height: 220,
                  child: Center(child: LoadingIndicator()),
                ),
                errorWidget: (_, __, ___) => Container(
                  height: 220,
                  color: isDarkMode ? Colors.grey[850] : Colors.grey[200],
                  child: const Icon(Icons.image_not_supported_outlined,
                      size: 50, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ✍️ اسم الكاتب ووقت النشر بتنسيق راقي
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (news.author != null && news.author!.isNotEmpty)
                  Text(
                    news.author!.toUpperCase(),
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 13,
                      color: isDarkMode ? Colors.white54 : Colors.grey[500],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      timeago.format(news.publishedAt ?? DateTime.now()),
                      style: TextStyle(
                        fontSize: 12,
                        color: isDarkMode ? Colors.white54 : Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),

            // 📰 عنوان المقال الرئيسي
            Text(
              news.title ?? '',
              style: textTheme.titleLarge?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(height: 1, thickness: 0.5, color: Colors.grey),
            const SizedBox(height: 20),

            // 📄 وصف ومحتوى المقال
            if (news.description != null && news.description!.isNotEmpty) ...[
              Text(
                news.description!,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  fontWeight: FontWeight.w500,
                  color: isDarkMode ? Colors.white70 : Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
            ],
            if (news.content != null && news.content!.isNotEmpty) ...[
              Text(
                news.content!,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  color: isDarkMode ? Colors.white60 : Colors.black54,
                ),
              ),
              const SizedBox(height: 30),
            ],

            // 🔗 زر متطور ومميز لفتح المقال الكامل بالخارج
            if (news.url != null && news.url!.isNotEmpty)
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      final Uri url = Uri.parse(news.url!);
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url,
                            mode: LaunchMode.externalApplication);
                      } else {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Could not launch the article URL.')),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    icon: const Icon(Icons.open_in_new_rounded, size: 18),
                    label: const Text(
                      'View Full Article on Web',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
