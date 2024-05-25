part of 'ent_api_bloc.dart';

abstract class EntApiState extends Equatable {
  const EntApiState();
}

class EntApiInitial extends EntApiState {
  List<Object> get props => [];
}

class EntApiLoading extends EntApiState {
  List<Object> get props => [];
}

class  EntApiLoaded extends EntApiState {
  List<Object> get props => [];

  final EntertainmentNewsModel entNewsModel;
  const  EntApiLoaded(this.entNewsModel);
}

class  EntApiError extends EntApiState {
  late final String? message;
  EntApiError(this.message);

  List<Object> get props => [];
}
