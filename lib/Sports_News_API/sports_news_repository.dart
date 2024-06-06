import 'package:news_api_task/Sports_News_API/sports_news_api.dart';
import 'package:news_api_task/Sports_News_API/sports_news_model.dart';

class SportsNewsAPIRepository {
  final _provider = SportsNewsAPIProvider();
  Future<SportsNewsModel> fetchsportsnewslist() {
    return _provider.fetchmysportsnewslist();  // Confusion
  }
}

class NetworkError extends Error {}