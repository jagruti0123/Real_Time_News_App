part of 'business_api_bloc.dart';

abstract class BusinessApiEvent extends Equatable {
  const BusinessApiEvent();
  List<Object> get props => [];
}

class BusinessApiData extends BusinessApiEvent {
  BusinessApiData();
}