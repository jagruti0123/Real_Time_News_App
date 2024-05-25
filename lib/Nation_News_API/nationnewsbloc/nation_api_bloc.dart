import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_api_task/Nation_News_API/models/nation_news_mode.dart';
import 'package:news_api_task/Nation_News_API/models/nation_news_repository.dart';

part 'nation_api_event.dart';
part 'nation_api_state.dart';

class NationApiBloc extends Bloc<NationApiEvent, NationApiState> {
  NationApiBloc() : super(NationApiInitial()) {
    NationNewsAPIRepository _apiRepository = NationNewsAPIRepository();
    on<NationApiEvent>((event, emit) async {   //PoliticsApiEvent
      try {
        emit(NationApiLoading());
        final nationNewsData = await _apiRepository.fetchnationnewslist();//remove my
        emit(NationApiLoaded(nationNewsData));
        if (nationNewsData.error != null) {
          print(nationNewsData.error);
          emit(NationApiError(nationNewsData.error));
        }
      } catch (e) {
        // Handle any potential exceptions that may occur during the API call
        emit(NationApiError(e.toString()));
      }
// } on NetworkError {
//     emit(MyTeamError("Failed to fetch data. is your device online?"));
//   }
    });
  }
}
