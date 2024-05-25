part of 'politics_api_bloc.dart';

abstract class PoliticsApiEvent extends Equatable {
  const PoliticsApiEvent();
  List<Object> get props => [];
}

class PoliticsApiData extends PoliticsApiEvent {
  PoliticsApiData();
}
