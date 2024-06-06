import 'package:dio/dio.dart';
import 'package:news_api_task/Crime_News_API/models/crime_news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CrimeNewsAPIProvider {
  final Dio _dio = Dio();

  Future<CrimeNewsModel> fetchmycrimenewslist() async {
    final prefs = await SharedPreferences.getInstance();
    var token = await prefs.getString('TOKEN');
    print("Fetch Watchlist Request");
    // print();
    final String _url = 'https://newsapi.org/v2/everything?q=crime&apiKey=7ba8778afdff45ac834125eeb630abd2&categories=crime&countries=in&languages=en';
    Response response = await _dio.get(_url,
      options: Options(
          headers: {
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
      return CrimeNewsModel.fromJson(response.data);
    } else if (response.statusCode == 422) {
      return CrimeNewsModel.withError(response.data["message"]);
    } else {
      return CrimeNewsModel.withError(response.data["message"]);
    }
  }
}