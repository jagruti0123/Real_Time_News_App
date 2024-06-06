

import 'package:news_api_task/Crime_News_API/models/crime_news_api.dart';
import 'package:news_api_task/Crime_News_API/models/crime_news_model.dart';

class CrimeNewsAPIRepository {
  final _provider = CrimeNewsAPIProvider();
  Future<CrimeNewsModel> fetchcrimenewslist() {
    return _provider.fetchmycrimenewslist();
  }
}

class NetworkError extends Error {}