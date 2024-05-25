part of 'tech_api_bloc.dart';

abstract class TechApiEvent extends Equatable {
  const TechApiEvent();
  List<Object> get props => [];
}

class TechApiData extends TechApiEvent {
  TechApiData();
}