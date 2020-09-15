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

      Pagination pagn = Pagination.fromJson(resp.data["pagination"] as Map<String, dynamic>);
      List<Article> list =
          (resp.data["data"] as List).map((art) => Article.fromJson(art as Map<String, dynamic>)).toList();

      return FetchNewsResponse(pagn, list);
    } on DioError catch (e) {
      if (e.response != null) {
        print("${e.response.statusCode} -> ${e.response.data}");
      } else {
        print(e.message);
      }
      throw Exception(e.message);
    } catch (e, stack) {
      print(e);
      print(stack);
      return null;
    }
  }

  Future<List<Article>> fetchHighlights() async {
    try {
      var resp = await _client.get("$_url/highlights");

      List<dynamic> data = resp.data["data"] as List;
      print("data type is ${data.runtimeType}");
      print("data length is ${data.length}");

      List<Article> mapped = data.map((dynamic e) => Article.fromJson(e as Map<String, dynamic>)).toList();

      return mapped;
    } on DioError catch (e) {
      if (e.response != null) {
        print("${e.response.statusCode} -> ${e.response.data}");
      } else {
        print(e.message);
      }
      throw Exception(e.message);
    } catch (e, stack) {
      print(e);
      print(stack);
      return [];
    }
  }
}
