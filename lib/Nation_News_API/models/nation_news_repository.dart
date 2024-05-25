import 'package:news_api_task/Nation_News_API/models/nation_news_api.dart';
import 'package:news_api_task/Nation_News_API/models/nation_news_mode.dart';

class NationNewsAPIRepository {
  final _provider = NationNewsAPIProvider();
  Future<NationNewsModel> fetchnationnewslist() {
    return _provider.fetchmynationnewslist();
  }
}

class NetworkError extends Error {}