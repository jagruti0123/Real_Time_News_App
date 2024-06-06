part of 'ent_api_bloc.dart';

abstract class EntApiEvent extends Equatable {
  const EntApiEvent();
  List<Object> get props => [];
}

class EntApiData extends EntApiEvent {
  EntApiData();
}