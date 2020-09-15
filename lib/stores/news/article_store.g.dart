// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ArticleStore on _ArticleStoreBase, Store {
  final _$contentAtom = Atom(name: '_ArticleStoreBase.content');

  @override
  Article get content {
    _$contentAtom.reportRead();
    return super.content;
  }

  @override
  set content(Article value) {
    _$contentAtom.reportWrite(value, super.content, () {
      super.content = value;
    });
  }

  final _$favoriteAtom = Atom(name: '_ArticleStoreBase.favorite');

  @override
  bool get favorite {
    _$favoriteAtom.reportRead();
    return super.favorite;
  }

  @override
  set favorite(bool value) {
    _$favoriteAtom.reportWrite(value, super.favorite, () {
      super.favorite = value;
    });
  }

  final _$_ArticleStoreBaseActionController =
      ActionController(name: '_ArticleStoreBase');

  @override
  dynamic setFavorite(bool value) {
    final _$actionInfo = _$_ArticleStoreBaseActionController.startAction(
        name: '_ArticleStoreBase.setFavorite');
    try {
      return super.setFavorite(value);
    } finally {
      _$_ArticleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
content: ${content},
favorite: ${favorite}
    ''';
  }
}
