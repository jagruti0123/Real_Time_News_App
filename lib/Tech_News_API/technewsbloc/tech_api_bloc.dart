import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_api_task/Tech_News_API/models/tech_news_model.dart';
import 'package:news_api_task/Tech_News_API/models/tech_news_repository.dart';

part 'tech_api_event.dart';
part 'tech_api_state.dart';

class TechApiBloc extends Bloc<TechApiEvent, TechApiState> {
  TechApiBloc() : super(TechApiInitial()) {
    TechNewsAPIRepository _apiRepository = TechNewsAPIRepository();
    on<TechApiEvent>((event, emit) async {   //PoliticsApiEvent
      try {
        emit(TechApiLoading());
        final techNewsData = await _apiRepository.fetchtechnewslist();//remove my
        emit(TechApiLoaded(techNewsData));
        if (techNewsData.error != null) {
          print(techNewsData.error);
          emit(TechApiError(techNewsData.error));
        }
      } catch (e) {
        // Handle any potential exceptions that may occur during the API call
        emit(TechApiError(e.toString()));
      }
// } on NetworkError {
//     emit(MyTeamError("Failed to fetch data. is your device online?"));
//   }
    });
  }
}
