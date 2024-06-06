part of 'science_api_bloc.dart';

abstract class ScienceApiEvent extends Equatable {
  const ScienceApiEvent();
  List<Object> get props => [];
}

class ScienceApiData extends ScienceApiEvent {
  ScienceApiData();
}