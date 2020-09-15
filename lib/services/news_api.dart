import 'package:dio/dio.dart';
import 'package:getmobx_mesa_news/configuration/configuration.dart';
import 'package:getmobx_mesa_news/models/article.dart';
import 'package:getmobx_mesa_news/models/pagination_model.dart';

class FetchNewsResponse {
  Pagination pagination;
  List<Article> data;
  FetchNewsResponse(this.pagination, this.data);
}

class NewsApi {
  final _url = BASE_URL + "/news";
  final _client = Dio();

  NewsApi({String token}) {
    _client.options.headers["Authorization"] = "Bearer $token";
  }

  Future<FetchNewsResponse> fetch({int currentPage, int perPage, String publishedAt}) async {
    var url =
        "?current_page=${currentPage ?? ''}" + "&per_page=${currentPage ?? ''}" + "&published_at=${publishedAt ?? ''}";
    print(url);

    try {
      var resp = await _client.get(url);

      Pagination pagn = Pagination.fromJson(resp.data["pagination"]);
      List<Article> list = List<Article>.from(resp.data["data"].map((art) => Article.fromJson(art)));

      return FetchNewsResponse(pagn, list);
    } on DioError catch (e) {
      if (e.response != null) {
        print("${e.response.statusCode} -> ${e.response.data}");
      } else {
        print(e.message);
      }
      throw Exception(e.message);
    }
  }

  Future<List<Article>> fetchHighlights() async {
    try {
      var resp = await _client.get("$_url/highlights");

      List<Article> list = List<Article>.from(resp.data["data"].map((art) => Article.fromJson(art)));
      return list;
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
