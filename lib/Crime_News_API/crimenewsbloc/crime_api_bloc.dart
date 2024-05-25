import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_api_task/Crime_News_API/models/crime_news_model.dart';
import 'package:news_api_task/Crime_News_API/models/crime_news_repository.dart';

part 'crime_api_event.dart';
part 'crime_api_state.dart';

class CrimeApiBloc extends Bloc<CrimeApiEvent, CrimeApiState> {
  CrimeApiBloc() : super(CrimeApiInitial()) {
    CrimeNewsAPIRepository _apiRepository = CrimeNewsAPIRepository();
    on<CrimeApiEvent>((event, emit) async {   //PoliticsApiEvent
      try {
        emit(CrimeApiLoading());
        final crimeNewsData = await _apiRepository.fetchcrimenewslist();//remove my
        emit(CrimeApiLoaded(crimeNewsData));
        if (crimeNewsData.error != null) {
          print(crimeNewsData.error);
          emit(CrimeApiError(crimeNewsData.error));
        }
      } catch (e) {
        // Handle any potential exceptions that may occur during the API call
        emit(CrimeApiError(e.toString()));
      }
// } on NetworkError {
//     emit(MyTeamError("Failed to fetch data. is your device online?"));
//   }
    });
  }
}
