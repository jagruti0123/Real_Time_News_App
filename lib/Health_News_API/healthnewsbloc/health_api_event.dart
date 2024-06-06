part of 'health_api_bloc.dart';

abstract class HealthApiEvent extends Equatable {
  const HealthApiEvent();
  List<Object> get props => [];
}

class HealthApiData extends HealthApiEvent {
  HealthApiData();
}
