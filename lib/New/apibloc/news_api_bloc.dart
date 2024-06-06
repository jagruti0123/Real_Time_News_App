import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_api_task/New/news_repository.dart';
import 'package:news_api_task/New/newsmodel.dart';

part 'news_api_event.dart';
part 'news_api_state.dart';

class NewsApiBloc extends Bloc<NewsApiEvent, NewsApiState> {
  NewsApiBloc() : super(NewsApiInitial()) {
    NewsAPIRepository _apiRepository = NewsAPIRepository();
    on<NewsApiData>((event, emit) async {
      try {
        emit(NewsApiLoading());
        final newsData = await _apiRepository.fetchnewslist();
        emit(NewsApiLoaded(newsData));
        if (newsData.error != null) {
          print(newsData.error);
          emit(NewsApiError(newsData.error));
        }
      } catch (e) {
        // Handle any potential exceptions that may occur during the API call
        emit(NewsApiError(e.toString()));
      }
// } on NetworkError {
//     emit(MyTeamError("Failed to fetch data. is your device online?"));
//   }
    });
  }
}

