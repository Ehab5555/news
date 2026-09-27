import 'package:flutter/material.dart';
import 'package:news/news/view/news_list.dart';
import 'package:news/sources/data/models/source_response/source.dart';

class SourcesTab extends StatefulWidget {
  final List<Source> sources;
  const SourcesTab({
    super.key,
    required this.sources,
  });

  @override
  State<SourcesTab> createState() => _SourcesTabState();
}

class _SourcesTabState extends State<SourcesTab> with TickerProviderStateMixin {
  int selectedSourceIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.sources.isEmpty) {
      return const Center(
        child: Text(
          'No sources available',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        // قائمة المصادر الأفقية بتصميم فاخر وعصري
        SizedBox(
          height: 48,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: widget.sources.length,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final source = widget.sources[index];
              final isSelected = selectedSourceIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSourceIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: isSelected
                          ? Colors.transparent
                          : Colors.grey.withValues(alpha: 0.2),
                      width: 1,
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withValues(alpha: 0.25),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : [],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    source.name ?? '',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                      color: isSelected ? Colors.white : Colors.grey[700],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),

        // قائمة الأخبار التابعة للمصدر المختار
        Expanded(
          child: NewsList(
            key: ValueKey(widget.sources[selectedSourceIndex].id),
            sourceId: widget.sources[selectedSourceIndex].id ?? '',
          ),
        ),
      ],
    );
  }
}
