import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_api_task/Slider_News_API/models/slider_news_model.dart';
import 'package:news_api_task/Slider_News_API/models/slider_news_repository.dart';

part 'slider_api_event.dart';
part 'slider_api_state.dart';

class SliderApiBloc extends Bloc<SliderApiEvent, SliderApiState> {
  SliderApiBloc() : super(SliderApiInitial()) {
    SliderNewsAPIRepository _apiRepository = SliderNewsAPIRepository();
    on<SliderApiEvent>((event, emit) async {   //PoliticsApiEvent
      try {
        emit(SliderApiLoading());
        final sliderNewsData = await _apiRepository.fetchslidernewslist();//remove my
        emit(SliderApiLoaded(sliderNewsData));
        if (sliderNewsData.error != null) {
          print(sliderNewsData.error);
          emit(SliderApiError(sliderNewsData.error));
        }
      } catch (e) {
        // Handle any potential exceptions that may occur during the API call
        emit(SliderApiError(e.toString()));
      }
// } on NetworkError {
//     emit(MyTeamError("Failed to fetch data. is your device online?"));
//   }
    });
  }
}
