part of 'science_api_bloc.dart';

abstract class ScienceApiState extends Equatable {
  const ScienceApiState();
}

class ScienceApiInitial extends ScienceApiState {
  @override
  List<Object> get props => [];
}

class ScienceApiLoading extends ScienceApiState {
  List<Object> get props => [];
}

class  ScienceApiLoaded extends ScienceApiState {
  List<Object> get props => [];

  final ScienceNewsModel scienceNewsModel;
  const  ScienceApiLoaded(this.scienceNewsModel);
}

class  ScienceApiError extends ScienceApiState {
  late final String? message;
  ScienceApiError(this.message);

  List<Object> get props => [];
}