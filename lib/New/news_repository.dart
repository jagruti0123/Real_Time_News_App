import 'package:news_api_task/New/news_api.dart';
import 'package:news_api_task/New/newsmodel.dart';

class NewsAPIRepository {
  final _provider = NewsAPIProvider();
  Future<NewsModel> fetchnewslist() {
    return _provider.fetchmynewslist();
  }
}

class NetworkError extends Error {}