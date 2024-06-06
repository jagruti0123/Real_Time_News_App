import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_api_task/Sports_News_API/sports_news_model.dart';
import 'package:news_api_task/Sports_News_API/sports_news_repository.dart';

part 'sports_api_event.dart';
part 'sports_api_state.dart';

class SportsApiBloc extends Bloc<SportsApiEvent, SportsApiState> {
  SportsApiBloc() : super(SportsApiInitial()) {
    SportsNewsAPIRepository _apiRepository = SportsNewsAPIRepository();
    on<SportsNewsApiData>((event, emit) async {
      try {
        emit(SportsNewsApiLoading());
        final sportsNewsData = await _apiRepository.fetchsportsnewslist();
        emit(SportsNewsApiLoaded(sportsNewsData));
        if (sportsNewsData.error != null) {
          print(sportsNewsData.error);
          emit(SportsNewsApiError(sportsNewsData.error));
        }
      } catch (e) {
        // Handle any potential exceptions that may occur during the API call
        emit(SportsNewsApiError(e.toString()));
      }
// } on NetworkError {
//     emit(MyTeamError("Failed to fetch data. is your device online?"));
//   }
    });
  }
}