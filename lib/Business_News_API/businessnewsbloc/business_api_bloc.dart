import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_api_task/Business_News_API/models/business_news_model.dart';
import 'package:news_api_task/Business_News_API/models/business_news_repository.dart';

part 'business_api_event.dart';
part 'business_api_state.dart';

class BusinessApiBloc extends Bloc<BusinessApiEvent, BusinessApiState> {
  BusinessApiBloc() : super(BusinessApiInitial()) {
    BusinessNewsAPIRepository _apiRepository = BusinessNewsAPIRepository();
    on<BusinessApiEvent>((event, emit) async {   //PoliticsApiEvent
      try {
        emit(BusinessApiLoading());
        final businessNewsData = await _apiRepository.fetchbusinessnewslist();//remove my
        emit(BusinessApiLoaded(businessNewsData));
        if (businessNewsData.error != null) {
          print(businessNewsData.error);
          emit(BusinessApiError(businessNewsData.error));
        }
      } catch (e) {
        // Handle any potential exceptions that may occur during the API call
        emit(BusinessApiError(e.toString()));
      }
// } on NetworkError {
//     emit(MyTeamError("Failed to fetch data. is your device online?"));
//   }
    });
  }
}
