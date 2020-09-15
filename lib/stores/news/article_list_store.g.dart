// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ArticleListStore on _ArticleListStoreBase, Store {
  Computed<bool> _$hasArticlesComputed;

  @override
  bool get hasArticles =>
      (_$hasArticlesComputed ??= Computed<bool>(() => super.hasArticles,
              name: '_ArticleListStoreBase.hasArticles'))
          .value;
  Computed<ObservableList<Article>> _$favoriteArticlesComputed;

  @override
  ObservableList<Article> get favoriteArticles =>
      (_$favoriteArticlesComputed ??= Computed<ObservableList<Article>>(
              () => super.favoriteArticles,
              name: '_ArticleListStoreBase.favoriteArticles'))
          .value;
  Computed<ObservableList<Article>> _$filteredArticlesComputed;

  @override
  ObservableList<Article> get filteredArticles =>
      (_$filteredArticlesComputed ??= Computed<ObservableList<Article>>(
              () => super.filteredArticles,
              name: '_ArticleListStoreBase.filteredArticles'))
          .value;

  final _$articlesAtom = Atom(name: '_ArticleListStoreBase.articles');

  @override
  ObservableList<dynamic> get articles {
    _$articlesAtom.reportRead();
    return super.articles;
  }

  @override
  set articles(ObservableList<dynamic> value) {
    _$articlesAtom.reportWrite(value, super.articles, () {
      super.articles = value;
    });
  }

  final _$filterFavoritesAtom =
      Atom(name: '_ArticleListStoreBase.filterFavorites');

  @override
  bool get filterFavorites {
    _$filterFavoritesAtom.reportRead();
    return super.filterFavorites;
  }

  @override
  set filterFavorites(bool value) {
    _$filterFavoritesAtom.reportWrite(value, super.filterFavorites, () {
      super.filterFavorites = value;
    });
  }

  final _$_ArticleListStoreBaseActionController =
      ActionController(name: '_ArticleListStoreBase');

  @override
  dynamic addArticles(List<Article> newArticles) {
    final _$actionInfo = _$_ArticleListStoreBaseActionController.startAction(
        name: '_ArticleListStoreBase.addArticles');
    try {
      return super.addArticles(newArticles);
    } finally {
      _$_ArticleListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
articles: ${articles},
filterFavorites: ${filterFavorites},
hasArticles: ${hasArticles},
favoriteArticles: ${favoriteArticles},
filteredArticles: ${filteredArticles}
    ''';
  }
}
