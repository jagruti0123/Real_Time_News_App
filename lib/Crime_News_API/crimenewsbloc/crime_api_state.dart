part of 'crime_api_bloc.dart';

abstract class CrimeApiState extends Equatable {
  const CrimeApiState();
}

class CrimeApiInitial extends CrimeApiState {
  List<Object> get props => [];
}

class CrimeApiLoading extends CrimeApiState {
  List<Object> get props => [];
}

class  CrimeApiLoaded extends CrimeApiState {
  List<Object> get props => [];

  final CrimeNewsModel crimeNewsModel;
  const  CrimeApiLoaded(this.crimeNewsModel);
}

class  CrimeApiError extends CrimeApiState {
  late final String? message;
  CrimeApiError(this.message);

  List<Object> get props => [];
}
