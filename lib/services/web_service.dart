import 'package:dio/dio.dart';
import 'package:tu_bear_hai/models/beers_model.dart';
import 'package:tu_bear_hai/utils/constants.dart';

class WebService {
  var dio = new Dio();

  Future<List<BeersModel>> fetchBeersByyears(String year) async {
    final response = await dio.get(Constants.yearSelect(year));

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result;
      list.forEach((res) {});
      return list.map((res) => BeersModel.fromJson(res)).toList();
    } else {
      throw Exception("Failled to get top news");
    }
  }

  Future<List<BeersModel>> fetchTopBeers() async {
    String url = Constants.BASE_URL;

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;

      Iterable list = result;

      list.forEach((res) {});
      return list.map((res) => BeersModel.fromJson(res)).toList();
    } else {
      throw Exception("Failled to get top news");
    }
  }
}
