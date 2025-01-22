import 'package:dio/dio.dart';
import 'package:holistic/models/article_model.dart';

class ApiServices {
  static var dio = Dio();

  static Future<List<ArticleModel>> getCategory(String category) async {
    var response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=beb27b6812424c1a8d74895e1d8afbcd');
    if (response.data['status'] != 'ok') {
      throw Exception();
    }
    return ArticleModel.fetch(response.data);
  }

  static Future<List> checkSignUp(
      String name, String email, String password, String phone) async {
    var response = await dio
        .post('https://elsewedyteam.runasp.net/api/Register/AddUser', data: {
      'Name': name,
      'Phone': phone,
      'Email': email,
      'password': password
    });
    print(response.data);
    var list = [response.data['status'], response.data['message']];
    return list;
  }

  static Future<List> checkSignIn(String email, String password) async {
    var response = await dio
        .post('https://elsewedyteam.runasp.net/api/Login/CheckUser', data: {
      'Email': email,
      'password': password,
    });
    print(response.data);
    var list = [response.data['status'], response.data['message']];
    return list;
  }
}
