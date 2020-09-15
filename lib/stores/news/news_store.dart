import 'package:get/get.dart';
import 'package:getmobx_mesa_news/models/article.dart';
import 'package:getmobx_mesa_news/models/pagination_model.dart';
import 'package:getmobx_mesa_news/services/news_api.dart';
import 'package:getmobx_mesa_news/stores/login/login_store.dart';
import 'package:getmobx_mesa_news/stores/news/article_list_store.dart';
import 'package:mobx/mobx.dart';
part 'news_store.g.dart';

class NewsStore = _NewsStoreBase with _$NewsStore;

abstract class _NewsStoreBase with Store {
  static const PER_PAGE = 10;
  int currPage = 1;

  final list = ArticleListStore();
  final loginStore = Get.find<LoginStore>();
  NewsApi api;

  _NewsStoreBase() {
    api = NewsApi(token: loginStore.token);
  }

  ObservableList highlights = ObservableList<Article>();

  @observable
  String highlightsError;
  @action
  setHighlightsError(String value) => highlightsError = value;

  @action
  dynamic fetchHighlights() async {
    try {
      List<Article> arts = await api.fetchHighlights();
      highlights.clear();
      highlights.addAll(arts);
    } catch (e) {
      print(e);
      setHighlightsError("Falha ao obter destaques.");
    }
  }

  @observable
  String listError;
  @action
  setListError(String value) => listError = value;

  incrementPagination(Pagination pagnt) {
    if (currPage < pagnt.totalPages) {
      currPage++;
    }
  }

  @action
  dynamic fetchArticles() async {
    try {
      FetchNewsResponse resp = await api.fetch(currentPage: currPage, perPage: PER_PAGE);
      incrementPagination(resp.pagination);
      list.addArticles(resp.data);
    } catch (e) {
      print(e);
      setListError("Falha ao obter últimas notícias");
    }
  }

  @observable
  bool isLoading = false;
  @action
  setLoading(bool value) => isLoading = value;

  @action
  fetchAll() async {
    setLoading(true);
    var futures = <Future>[];
    futures.add(fetchArticles());
    futures.add(fetchHighlights());
    await Future.wait(futures);
    setLoading(false);
  }
}
