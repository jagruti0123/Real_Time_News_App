

import 'package:news_api_task/Tech_News_API/models/tech_news_api.dart';
import 'package:news_api_task/Tech_News_API/models/tech_news_model.dart';

class TechNewsAPIRepository {
  final _provider = TechNewsAPIProvider();
  Future<TechNewsModel> fetchtechnewslist() {
    return _provider.fetchmytechnewslist();
  }
}

class NetworkError extends Error {}