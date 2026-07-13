import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/data/models/news_response/news.dart';
import 'package:news/search/repository/search_repository.dart';
import 'package:news/shared/service_locator.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  late final SearchRepository searchRespository;
  SearchCubit() : super(SearchInitial()) {
    searchRespository = SearchRepository(ServiceLocator.newsDataSource);
  }

  Future<void> newsSearch(String query) async {
    emit(SearchLoading());
    try {
      final news = await searchRespository.searchNews(query);
      emit(SearchSuccess(news));
    } catch (error) {
      emit(SearchError(error.toString()));
    }
  }
}
