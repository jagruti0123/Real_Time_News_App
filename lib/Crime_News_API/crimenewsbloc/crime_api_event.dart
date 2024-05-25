part of 'crime_api_bloc.dart';

abstract class CrimeApiEvent extends Equatable {
  const CrimeApiEvent();
  List<Object> get props => [];
}

class CrimeApiData extends CrimeApiEvent {
  CrimeApiData();
}