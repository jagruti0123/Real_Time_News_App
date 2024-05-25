part of 'slider_api_bloc.dart';

abstract class SliderApiState extends Equatable {
  const SliderApiState();
}

class SliderApiInitial extends SliderApiState {
  List<Object> get props => [];
}

class SliderApiLoading extends SliderApiState {
  List<Object> get props => [];
}

class  SliderApiLoaded extends SliderApiState {
  List<Object> get props => [];

  final SliderNewsModel sliderNewsModel;
  const  SliderApiLoaded(this.sliderNewsModel);
}

class  SliderApiError extends SliderApiState {
  late final String? message;
  SliderApiError(this.message);

  List<Object> get props => [];
}
