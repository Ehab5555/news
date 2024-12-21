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
  final sourceViewModel = SourceViewModel();

  @override
  void initState() {
    sourceViewModel.getSources(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sourceViewModel,
      child: BlocBuilder<SourceViewModel, SourcesStates>(
        builder: (_, state) {
          if (state is GetSourcesLoading) {
            return const LoadingIndicator();
          } else if (state is GetSourcesError) {
            return ErrorIndicator(errorMessage: state.errorMessage);
          } else if (state is GetSourcesSuccess) {
            return SourcesTab(sources: state.sources);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
