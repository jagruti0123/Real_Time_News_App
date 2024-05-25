

import 'package:news_api_task/Business_News_API/models/business_news_api.dart';
import 'package:news_api_task/Business_News_API/models/business_news_model.dart';

class BusinessNewsAPIRepository {
  final _provider = BusinessNewsAPIProvider();
  Future<BusinessNewsModel> fetchbusinessnewslist() {
    return _provider.fetchmybusinessnewslist();
  }
}

class NetworkError extends Error {}