part of 'health_api_bloc.dart';

abstract class HealthApiState extends Equatable {
  const HealthApiState();
}

class HealthApiInitial extends HealthApiState {
  List<Object> get props => [];
}

class HealthApiLoading extends HealthApiState {
  List<Object> get props => [];
}

class  HealthApiLoaded extends HealthApiState {
  List<Object> get props => [];

  final HealthNewsModel healthNewsModel;
  const  HealthApiLoaded(this.healthNewsModel);
}

class  HealthApiError extends HealthApiState {
  late final String? message;
  HealthApiError(this.message);

  List<Object> get props => [];
}