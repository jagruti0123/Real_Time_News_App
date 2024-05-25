
part of 'sports_api_bloc.dart';

abstract class SportsApiState extends Equatable {
  const SportsApiState();
}

class SportsApiInitial extends SportsApiState {
  List<Object> get props => [];
}

class SportsNewsApiLoading extends SportsApiState {
  List<Object> get props => [];
}

class  SportsNewsApiLoaded extends SportsApiState {
  List<Object> get props => [];

  final SportsNewsModel sportsNewsModel;
  const  SportsNewsApiLoaded(this.sportsNewsModel);
}

class  SportsNewsApiError extends SportsApiState {
  late final String? message;
  SportsNewsApiError(this.message);

  List<Object> get props => [];
}
