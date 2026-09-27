import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:news/sources/view/sources_tab.dart';
import 'package:news/sources/view_model/source_view_model.dart';
import 'package:news/sources/view_model/sources_states.dart';

class CategoryDetails extends StatefulWidget {
  final String categoryId;
  const CategoryDetails({
    super.key,
    required this.categoryId,
  });

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  late final SourceViewModel _sourceViewModel;

  @override
  void initState() {
    super.initState();
    _sourceViewModel = SourceViewModel();
    // جلب المصادر الخاصة بالتصنيف عند البدء
    _sourceViewModel.getSources(widget.categoryId);
  }

  @override
  void didUpdateWidget(covariant CategoryDetails oldWidget) {
    super.didUpdateWidget(oldWidget);
    // جلب المصادر مجدداً في حال تم تغيير التصنيف
    if (oldWidget.categoryId != widget.categoryId) {
      _sourceViewModel.getSources(widget.categoryId);
    }
  }

  @override
  void dispose() {
    _sourceViewModel.close(); // إغلاق الـ ViewModel لمنع تسريب الذاكرة
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _sourceViewModel,
      child: BlocBuilder<SourceViewModel, SourcesStates>(
        builder: (context, state) {
          if (state is GetSourcesLoading) {
            return const Center(child: LoadingIndicator());
          } else if (state is GetSourcesError) {
            return Center(
              child: ErrorIndicator(
                errorMessage: state.errorMessage,
                onRetry: () => _sourceViewModel.getSources(widget.categoryId),
              ),
            );
          } else if (state is GetSourcesSuccess) {
            if (state.sources.isEmpty) {
              return const Center(
                child: Text(
                  'No news sources available for this category.',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              );
            }
            return SourcesTab(sources: state.sources);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
