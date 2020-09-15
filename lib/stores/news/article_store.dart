import 'package:getmobx_mesa_news/models/article.dart';
import 'package:mobx/mobx.dart';
part 'article_store.g.dart';

class ArticleStore = _ArticleStoreBase with _$ArticleStore;

abstract class _ArticleStoreBase with Store {
  _ArticleStoreBase(this.content) {
    setFavorite(false);
  }

  @observable
  Article content;

  @observable
  bool favorite;

  @action
  setFavorite(bool value) {
    favorite = value;
  }
}
