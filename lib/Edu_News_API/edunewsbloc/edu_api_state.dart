part of 'edu_api_bloc.dart';

abstract class EduApiState extends Equatable {
  const EduApiState();
}

class EduApiInitial extends EduApiState {
  List<Object> get props => [];
}

class EduApiLoading extends EduApiState {
  List<Object> get props => [];
}

class  EduApiLoaded extends EduApiState {
  List<Object> get props => [];

  final EduNewsModel eduNewsModel;
  const  EduApiLoaded(this.eduNewsModel);
}

class  EduApiError extends EduApiState {
  late final String? message;
  EduApiError(this.message);

  List<Object> get props => [];
}