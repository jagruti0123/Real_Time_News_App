part of 'edu_api_bloc.dart';

abstract class EduApiEvent extends Equatable {
  const EduApiEvent();
  List<Object> get props => [];
}

class EduApiData extends EduApiEvent {
  EduApiData();
}
