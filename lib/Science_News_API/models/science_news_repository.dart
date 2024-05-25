
import 'package:news_api_task/Science_News_API/models/science_news_api.dart';
import 'package:news_api_task/Science_News_API/models/science_news_model.dart';

class ScienceNewsAPIRepository {
  final _provider = ScienceNewsAPIProvider();
  Future<ScienceNewsModel> fetchsciencenewslist() {
    return _provider.fetchmysciencenewslist();
  }
}

class NetworkError extends Error {}