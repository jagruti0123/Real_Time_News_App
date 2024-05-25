
import 'package:news_api_task/Slider_News_API/models/slider_news_api.dart';
import 'package:news_api_task/Slider_News_API/models/slider_news_model.dart';

class SliderNewsAPIRepository {
  final _provider = SliderNewsAPIProvider();
  Future<SliderNewsModel> fetchslidernewslist() {
    return _provider.fetchmyslidernewslist();
  }
}

class NetworkError extends Error {}