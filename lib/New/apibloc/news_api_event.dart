part of 'news_api_bloc.dart';

abstract class NewsApiEvent extends Equatable {
  const NewsApiEvent();
  List<Object> get props => [];
}

class NewsApiData extends NewsApiEvent {
  NewsApiData();
}