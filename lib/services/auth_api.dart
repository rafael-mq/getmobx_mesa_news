import 'package:dio/dio.dart';
import 'package:getmobx_mesa_news/configuration/configuration.dart';
import 'package:getmobx_mesa_news/models/user.dart';

class AuthApi {
  final _url = BASE_URL + "/auth";
  final _client = Dio();

  Future<User> login(Map<String, String> data) async {
    try {
      print("login data -> $data");
      Response resp = await _client.post("$_url/signin", data: data);
      print("received -> ${resp.data}");
      return User(
        email: data["email"],
        password: data["password"],
        token: resp.data["token"],
      );
    } on DioError catch (e) {
      if (e.response != null) {
        print("${e.response.statusCode} -> ${e.response.data}");
      } else {
        print(e.message);
      }
      throw Exception(e.message);
    }
  }
}
