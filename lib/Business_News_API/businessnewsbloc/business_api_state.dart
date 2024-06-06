part of 'business_api_bloc.dart';

abstract class BusinessApiState extends Equatable {
  const BusinessApiState();
}

class BusinessApiInitial extends BusinessApiState {
  List<Object> get props => [];
}

class BusinessApiLoading extends BusinessApiState {
  List<Object> get props => [];
}

class  BusinessApiLoaded extends BusinessApiState {
  List<Object> get props => [];

  final BusinessNewsModel businessNewsModel;
  const  BusinessApiLoaded(this.businessNewsModel);
}

class  BusinessApiError extends BusinessApiState {
  late final String? message;
  BusinessApiError(this.message);

  List<Object> get props => [];
}