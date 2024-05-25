part of 'sports_api_bloc.dart';

abstract class SportsApiEvent extends Equatable {
  const SportsApiEvent();
  List<Object> get props => [];
}

class SportsNewsApiData extends SportsApiEvent {
  SportsNewsApiData();
}
