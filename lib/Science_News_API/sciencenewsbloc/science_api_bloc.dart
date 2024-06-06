import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_api_task/Science_News_API/models/science_news_model.dart';
import 'package:news_api_task/Science_News_API/models/science_news_repository.dart';

part 'science_api_event.dart';
part 'science_api_state.dart';

class ScienceApiBloc extends Bloc<ScienceApiEvent, ScienceApiState> {
  ScienceApiBloc() : super(ScienceApiInitial()) {
    ScienceNewsAPIRepository _apiRepository = ScienceNewsAPIRepository();
    on<ScienceApiEvent>((event, emit) async {   //PoliticsApiEvent
      try {
        emit(ScienceApiLoading());
        final scienceNewsData = await _apiRepository.fetchsciencenewslist();//remove my
        emit(ScienceApiLoaded(scienceNewsData));
        if (scienceNewsData.error != null) {
          print(scienceNewsData.error);
          emit(ScienceApiError(scienceNewsData.error));
        }
      } catch (e) {
        // Handle any potential exceptions that may occur during the API call
        emit(ScienceApiError(e.toString()));
      }
// } on NetworkError {
//     emit(MyTeamError("Failed to fetch data. is your device online?"));
//   }
    });
  }
}
