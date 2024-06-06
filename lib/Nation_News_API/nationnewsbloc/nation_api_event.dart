part of 'nation_api_bloc.dart';

abstract class NationApiEvent extends Equatable {
  const NationApiEvent();
  List<Object> get props => [];
}

class NationApiData extends NationApiEvent {
  NationApiData();
}