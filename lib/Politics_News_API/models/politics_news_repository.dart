

import 'package:news_api_task/Politics_News_API/models/politics_news_api.dart';
import 'package:news_api_task/Politics_News_API/models/politics_news_model.dart';

class PoliticsNewsAPIRepository {
  final _provider = PoliticsNewsAPIProvider();
  Future<PoliticsNewsModel> fetchpoliticsnewslist() {
    return _provider.fetchmypoliticsnewslist();
  }
}

class NetworkError extends Error {}