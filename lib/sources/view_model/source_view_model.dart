import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/service_locator.dart';
import 'package:news/sources/repository/sources_respository.dart';
import 'package:news/sources/view_model/sources_states.dart';

class SourceViewModel extends Cubit<SourcesStates> {
  late final SourcesRespository sourcesRespository;
  SourceViewModel() : super(SourcesInitial()) {
    sourcesRespository = SourcesRespository(ServiceLocator.sourcesDataSource);
  }
  Future<void> getSources(String categoryId) async {
    emit(GetSourcesLoading());
    try {
      final sources = await sourcesRespository.getSources(categoryId);
      emit(GetSourcesSuccess(sources));
    } catch (error) {
      emit(GetSourcesError(error.toString()));
    }
  }
}
