import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_api_task/Health_News_API/models/health_news_model.dart';
import 'package:news_api_task/Health_News_API/models/health_news_repository.dart';

part 'health_api_event.dart';
part 'health_api_state.dart';

class HealthApiBloc extends Bloc<HealthApiEvent, HealthApiState> {
  HealthApiBloc() : super(HealthApiInitial()) {
    HealthNewsAPIRepository _apiRepository = HealthNewsAPIRepository();
    on<HealthApiEvent>((event, emit) async {   //PoliticsApiEvent
      try {
        emit(HealthApiLoading());
        final healthNewsData = await _apiRepository.fetchhealthnewslist();//remove my
        emit(HealthApiLoaded(healthNewsData));
        if (healthNewsData.error != null) {
          print(healthNewsData.error);
          emit(HealthApiError(healthNewsData.error));
        }
      } catch (e) {
        // Handle any potential exceptions that may occur during the API call
        emit(HealthApiError(e.toString()));
      }
// } on NetworkError {
//     emit(MyTeamError("Failed to fetch data. is your device online?"));
//   }
    });
  }
}
