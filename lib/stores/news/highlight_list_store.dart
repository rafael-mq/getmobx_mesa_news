import 'package:getmobx_mesa_news/models/article.dart';
import 'package:mobx/mobx.dart';
import 'article_store.dart';

part 'highlight_list_store.g.dart';

class HighlightListStore = _HighlightListStoreBase with _$HighlightListStore;

abstract class _HighlightListStoreBase with Store {
  @observable
  ObservableList articles = ObservableList<ArticleStore>();

  @computed
  bool get hasArticles => articles.length > 0;

  // @computed
  // ObservableList<Article> get favoriteHighlights => ObservableList.of(articles.where((art) => art.favorite == true));

  // @computed
  // ObservableList<Article> get filteredHighlights => filterFavorites ? favoriteHighlights : articles;

  // @observable
  // bool filterFavorites = false;

  @action
  addArticles(List<Article> newArticles) {
    articles.addAll(newArticles.map((art) => ArticleStore(art)));
  }
}
