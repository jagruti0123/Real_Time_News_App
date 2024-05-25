
import 'package:news_api_task/Edu_News_API/models/edu_news_api.dart';
import 'package:news_api_task/Edu_News_API/models/edu_news_model.dart';

class EduNewsAPIRepository {
  final _provider = EduNewsAPIProvider();
  Future<EduNewsModel> fetchedunewslist() {
    return _provider.fetchmyedunewslist();
  }
}

class NetworkError extends Error {}