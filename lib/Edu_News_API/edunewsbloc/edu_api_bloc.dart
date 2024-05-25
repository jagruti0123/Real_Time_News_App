import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_api_task/Edu_News_API/models/edu_news_model.dart';
import 'package:news_api_task/Edu_News_API/models/edu_news_repository.dart';

part 'edu_api_event.dart';
part 'edu_api_state.dart';

class EduApiBloc extends Bloc<EduApiEvent, EduApiState> {
  EduApiBloc() : super(EduApiInitial()) {
    EduNewsAPIRepository _apiRepository = EduNewsAPIRepository();
    on<EduApiEvent>((event, emit) async {   //PoliticsApiEvent
      try {
        emit(EduApiLoading());
        final eduNewsData = await _apiRepository.fetchedunewslist();//remove my
        emit(EduApiLoaded(eduNewsData));
        if (eduNewsData.error != null) {
          print(eduNewsData.error);
          emit(EduApiError(eduNewsData.error));
        }
      } catch (e) {
        // Handle any potential exceptions that may occur during the API call
        emit(EduApiError(e.toString()));
      }
// } on NetworkError {
//     emit(MyTeamError("Failed to fetch data. is your device online?"));
//   }
    });
  }
}
