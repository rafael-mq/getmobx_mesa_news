import 'package:getmobx_mesa_news/models/article.dart';
import 'package:getmobx_mesa_news/stores/news/article_store.dart';
import 'package:mobx/mobx.dart';

part 'article_list_store.g.dart';

class ArticleListStore = _ArticleListStoreBase with _$ArticleListStore;

abstract class _ArticleListStoreBase with Store {
  @observable
  ObservableList<ArticleStore> articles = ObservableList<ArticleStore>();

  @computed
  bool get hasArticles => articles.length > 0;

  @computed
  ObservableList<ArticleStore> get favoriteArticles => ObservableList.of(articles.where((art) => art.favorite == true));

  @computed
  ObservableList<ArticleStore> get filteredArticles => filterFavorites ? favoriteArticles : articles;

  @observable
  bool filterFavorites = false;

  @action
  addArticles(List<Article> newArticles) {
    articles.addAll(newArticles.map((art) => ArticleStore(art)));
  }

  @action
  clear() {
    articles.clear();
  }
}
