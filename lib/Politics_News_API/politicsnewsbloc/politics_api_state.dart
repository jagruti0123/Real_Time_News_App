part of 'politics_api_bloc.dart';

abstract class PoliticsApiState extends Equatable {
  const PoliticsApiState();
}

class PoliticsApiInitial extends PoliticsApiState {
  List<Object> get props => [];
}

class PoliticsApiLoading extends PoliticsApiState {
  List<Object> get props => [];
}

class  PoliticsApiLoaded extends PoliticsApiState {
  List<Object> get props => [];

  final PoliticsNewsModel politicsNewsModel;
  const  PoliticsApiLoaded(this.politicsNewsModel);
}

class  PoliticsApiError extends PoliticsApiState {
  late final String? message;
  PoliticsApiError(this.message);

  List<Object> get props => [];
}