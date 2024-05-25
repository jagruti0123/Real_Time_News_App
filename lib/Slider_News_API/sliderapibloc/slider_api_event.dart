part of 'slider_api_bloc.dart';

abstract class SliderApiEvent extends Equatable {
  const SliderApiEvent();
  List<Object> get props => [];
}

class SliderApiData extends SliderApiEvent {
  SliderApiData();
}