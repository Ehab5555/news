import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/respository/news_respository.dart';
import 'package:news/news/view_model/news_states.dart';
import 'package:news/shared/service_locator.dart';

class NewsViewModel extends Cubit<NewsStates> {
  late final NewsRespository newsRespository;
  NewsViewModel() : super(NewsInitial()) {
    newsRespository = NewsRespository(ServiceLocator.newsDataSource);
  }

  Future<void> getNews(String sourceId) async {
    emit(GetNewsLoading());
    try {
      final news = await newsRespository.getNews(sourceId);
      emit(GetNewsSuccess(news));
    } catch (error) {
      emit(GetNewsError(error.toString()));
    }
  }

  Future<void> newsSearch(String keyword) async {
    emit(GetNewsLoading());
    try {
      final news = await newsRespository.newsSearch(keyword);
      emit(NewsSearch(news));
    } catch (error) {
      emit(GetNewsError(error.toString()));
    }
  }
}
