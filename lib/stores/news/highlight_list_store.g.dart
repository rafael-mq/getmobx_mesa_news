// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'highlight_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HighlightListStore on _HighlightListStoreBase, Store {
  Computed<bool> _$hasArticlesComputed;

  @override
  bool get hasArticles =>
      (_$hasArticlesComputed ??= Computed<bool>(() => super.hasArticles,
              name: '_HighlightListStoreBase.hasArticles'))
          .value;
  Computed<ObservableList<Article>> _$favoriteHighlightsComputed;

  @override
  ObservableList<Article> get favoriteHighlights =>
      (_$favoriteHighlightsComputed ??= Computed<ObservableList<Article>>(
              () => super.favoriteHighlights,
              name: '_HighlightListStoreBase.favoriteHighlights'))
          .value;
  Computed<ObservableList<Article>> _$filteredHighlightsComputed;

  @override
  ObservableList<Article> get filteredHighlights =>
      (_$filteredHighlightsComputed ??= Computed<ObservableList<Article>>(
              () => super.filteredHighlights,
              name: '_HighlightListStoreBase.filteredHighlights'))
          .value;

  final _$articlesAtom = Atom(name: '_HighlightListStoreBase.articles');

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
      Atom(name: '_HighlightListStoreBase.filterFavorites');

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

  final _$_HighlightListStoreBaseActionController =
      ActionController(name: '_HighlightListStoreBase');

  @override
  dynamic addArticles(List<Article> newArticles) {
    final _$actionInfo = _$_HighlightListStoreBaseActionController.startAction(
        name: '_HighlightListStoreBase.addArticles');
    try {
      return super.addArticles(newArticles);
    } finally {
      _$_HighlightListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
articles: ${articles},
filterFavorites: ${filterFavorites},
hasArticles: ${hasArticles},
favoriteHighlights: ${favoriteHighlights},
filteredHighlights: ${filteredHighlights}
    ''';
  }
}
