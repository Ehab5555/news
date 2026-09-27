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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDarkMode
              ? Colors.white.withValues(alpha: 0.05)
              : Colors.black.withValues(alpha: 0.04),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDarkMode ? 0.3 : 0.03),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🖼️ صورة الخبر بتصميم حواف دائرية فاخرة
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              height: MediaQuery.sizeOf(context).height * 0.22,
              width: double.infinity,
              fit: BoxFit.cover, // تم التعديل لضمان عدم تشوه الصورة
              placeholder: (_, __) => const SizedBox(
                height: 180,
                child: Center(child: LoadingIndicator()),
              ),
              errorWidget: (_, __, ___) => Container(
                height: 180,
                color: isDarkMode ? Colors.grey[850] : Colors.grey[200],
                child: const Icon(
                  Icons.image_not_supported_outlined,
                  size: 40,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // ✍️ اسم الكاتب أو المصدر بتنسيق راقي
          if (news.author != null && news.author!.isNotEmpty) ...[
            Text(
              news.author!.toUpperCase(),
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
                color: Theme.of(context).primaryColor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
          ],

          // 📰 عنوان الخبر الرئيسي
          Text(
            news.title ?? '',
            style: textTheme.titleLarge?.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              height: 1.3,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),

          // ⏰ وقت النشر في الأسفل بتنسيق هادئ
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.access_time_rounded,
                size: 12,
                color: isDarkMode ? Colors.white54 : Colors.grey[500],
              ),
              const SizedBox(width: 4),
              Text(
                timeago.format(news.publishedAt ?? DateTime.now()),
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: isDarkMode ? Colors.white54 : Colors.grey[500],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
