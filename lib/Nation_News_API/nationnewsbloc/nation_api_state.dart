part of 'nation_api_bloc.dart';

abstract class NationApiState extends Equatable {
  const NationApiState();
}

class NationApiInitial extends NationApiState {
  List<Object> get props => [];
}

class NationApiLoading extends NationApiState {
  List<Object> get props => [];
}

class  NationApiLoaded extends NationApiState {
  List<Object> get props => [];

  final NationNewsModel nationNewsModel;
  const  NationApiLoaded(this.nationNewsModel);
}

class  NationApiError extends NationApiState {
  late final String? message;
  NationApiError(this.message);

  List<Object> get props => [];
}