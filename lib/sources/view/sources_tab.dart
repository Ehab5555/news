import 'package:flutter/material.dart';
import 'package:news/news/view/news_list.dart';
import 'package:news/sources/data/models/source_response/source.dart';
import 'package:news/sources/view/source_item.dart';

class SourcesTab extends StatefulWidget {
  final List<Source> sources;
  const SourcesTab({
    super.key,
    required this.sources,
  });

  @override
  State<SourcesTab> createState() => _SourcesTabState();
}

class _SourcesTabState extends State<SourcesTab> {
  int selectedSource = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(start: 24, top: 6),
          child: DefaultTabController(
            length: widget.sources.length,
            initialIndex: selectedSource,
            child: TabBar(
              onTap: (value) {
                selectedSource = value;
                setState(() {});
              },
              dividerHeight: 0,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
              tabs: widget.sources
                  .map(
                    (source) => SourceItem(
                      source: source.name ?? '',
                      isSelected:
                          selectedSource == widget.sources.indexOf(source)
                              ? true
                              : false,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        Expanded(
          child: NewsList(
            sourceId: widget.sources[selectedSource].id ?? '',
          ),
        ),
      ],
    );
  }
}
