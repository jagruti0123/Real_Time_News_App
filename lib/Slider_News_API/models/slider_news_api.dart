import 'package:dio/dio.dart';
import 'package:news_api_task/Slider_News_API/models/slider_news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SliderNewsAPIProvider {
  final Dio _dio = Dio();

  Future<SliderNewsModel> fetchmyslidernewslist() async {
    final prefs = await SharedPreferences.getInstance();
    var token = await prefs.getString('TOKEN');
    print("Fetch Watchlist Request");
    // print();
    final String _url = 'https://gnews.io/api/v4/top-headlines?category=general&lang=en&country=in&max=10&apikey=275ca3837592732ddd671ed7f65887ff';
    Response response = await _dio.get(_url,
      options: Options(
          headers: {
            //
            // 'APP-KEY': '6eJpWk44EtJT4ZgzyLnSjbGAuMtjJTvE',
            // 'APP-SECRET':'kGywvF35GRhxX5KUHEBtYZ6vMQbpZLAV',
            // 'Content-type': 'application/json',
            // "Authorization": "Bearer " + token!
          },
          validateStatus: (status) {
            return status! == 401 || status == 200 || status == 422;
          }),
      // data: myTeamData,
    );
    print("Fetch Response");
    print(response);
    if (response.statusCode == 200) {
      return SliderNewsModel.fromJson(response.data);
    } else if (response.statusCode == 422) {
      return SliderNewsModel.withError(response.data["message"]);
    } else {
      return SliderNewsModel.withError(response.data["message"]);
    }
  }
}