
import 'package:news_api_task/Health_News_API/models/health_news_api.dart';
import 'package:news_api_task/Health_News_API/models/health_news_model.dart';

class HealthNewsAPIRepository {
  final _provider = HealthNewsAPIProvider();
  Future<HealthNewsModel> fetchhealthnewslist() {
    return _provider.fetchmyhealthnewslist();
  }
}

class NetworkError extends Error {}