import 'package:get/get.dart';
import 'package:getmobx_mesa_news/models/article.dart';
import 'package:getmobx_mesa_news/models/pagination_model.dart';
import 'package:getmobx_mesa_news/services/news_api.dart';
import 'package:getmobx_mesa_news/stores/login/login_store.dart';
import 'package:getmobx_mesa_news/stores/news/article_list_store.dart';
import 'package:getmobx_mesa_news/stores/news/article_store.dart';
import 'package:mobx/mobx.dart';
part 'news_store.g.dart';

class NewsStore = _NewsStoreBase with _$NewsStore;

abstract class _NewsStoreBase with Store {
  static const PER_PAGE = 10;
  int currPage = 1;

  final articleList = ArticleListStore();
  final highlightList = ArticleListStore();
  final loginStore = Get.find<LoginStore>();
  NewsApi api;

  _NewsStoreBase() {
    api = NewsApi(token: loginStore.token);
  }

  @observable
  String highlightsError;
  @action
  setHighlightsError(String value) => highlightsError = value;

  @action
  dynamic fetchHighlights() async {
    try {
      List<Article> arts = await api.fetchHighlights();
      highlightList.clear();
      highlightList.addArticles(arts);
    } catch (e) {
      print("error at fetchHighlights -> $e");
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
      articleList.addArticles(resp.data.where((el) => el.imageUrl != null).toList());
    } catch (e, stack) {
      print("aconteceu um erro => $e");
      print(stack);
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

  @observable
  bool filterFavorites = false;
  @action
  setFilterFavorites(bool value) {
    filterFavorites = value;
  }

  @computed
  List<ArticleStore> get filteredArticles => filterFavorites
      ? ObservableList.of(articleList.articles.where((art) => art.favorite == true))
      : articleList.articles;

  @computed
  List<ArticleStore> get filteredHighlights => filterFavorites
      ? ObservableList.of(highlightList.articles.where((art) => art.favorite == true))
      : highlightList.articles;
}
