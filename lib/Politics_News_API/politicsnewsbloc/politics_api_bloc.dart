import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_api_task/Politics_News_API/models/politics_news_model.dart';
import 'package:news_api_task/Politics_News_API/models/politics_news_repository.dart';

part 'politics_api_event.dart';
part 'politics_api_state.dart';

class PoliticsApiBloc extends Bloc<PoliticsApiEvent, PoliticsApiState> {
  PoliticsApiBloc() : super(PoliticsApiInitial()) {
    PoliticsNewsAPIRepository _apiRepository = PoliticsNewsAPIRepository();
    on<PoliticsApiData>((event, emit) async {   //PoliticsApiEvent
      try {
        emit(PoliticsApiLoading());
        final politicsNewsData = await _apiRepository.fetchpoliticsnewslist();//remove my
        emit(PoliticsApiLoaded(politicsNewsData));
        if (politicsNewsData.error != null) {
          print(politicsNewsData.error);
          emit(PoliticsApiError(politicsNewsData.error));
        }
      } catch (e) {
        // Handle any potential exceptions that may occur during the API call
        emit(PoliticsApiError(e.toString()));
      }
// } on NetworkError {
//     emit(MyTeamError("Failed to fetch data. is your device online?"));
//   }
    });
  }
}
