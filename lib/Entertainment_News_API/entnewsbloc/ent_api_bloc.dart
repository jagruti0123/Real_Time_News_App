import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_api_task/Entertainment_News_API/models/ent_news_model.dart';
import 'package:news_api_task/Entertainment_News_API/models/ent_news_repository.dart';

part 'ent_api_event.dart';
part 'ent_api_state.dart';

class EntApiBloc extends Bloc<EntApiEvent, EntApiState> {
  EntApiBloc() : super(EntApiInitial()) {
    EntNewsAPIRepository _apiRepository = EntNewsAPIRepository();
    on<EntApiEvent>((event, emit) async {   //PoliticsApiEvent
      try {
        emit(EntApiLoading());
        final healthNewsData = await _apiRepository.fetchentnewslist();//remove my
        emit(EntApiLoaded(healthNewsData));
        if (healthNewsData.error != null) {
          print(healthNewsData.error);
          emit(EntApiError(healthNewsData.error));
        }
      } catch (e) {
        // Handle any potential exceptions that may occur during the API call
        emit(EntApiError(e.toString()));
      }
// } on NetworkError {
//     emit(MyTeamError("Failed to fetch data. is your device online?"));
//   }
    });
  }
}
