part of 'tech_api_bloc.dart';

abstract class TechApiState extends Equatable {
  const TechApiState();
}

class TechApiInitial extends TechApiState {
  List<Object> get props => [];
}

class TechApiLoading extends TechApiState {
  List<Object> get props => [];
}

class  TechApiLoaded extends TechApiState{
  List<Object> get props => [];

  final TechNewsModel techNewsModel;
  const  TechApiLoaded(this.techNewsModel);
}

class  TechApiError extends TechApiState {
  late final String? message;
  TechApiError(this.message);

  List<Object> get props => [];
}