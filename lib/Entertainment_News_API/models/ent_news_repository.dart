
import 'package:news_api_task/Entertainment_News_API/models/ent_news_api.dart';
import 'package:news_api_task/Entertainment_News_API/models/ent_news_model.dart';

class EntNewsAPIRepository {
  final _provider = EntNewsAPIProvider();
  Future<EntertainmentNewsModel> fetchentnewslist() {
    return _provider.fetchmyentnewslist();
  }
}

class NetworkError extends Error {}