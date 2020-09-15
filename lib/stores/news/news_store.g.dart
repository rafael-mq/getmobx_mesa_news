// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsStore on _NewsStoreBase, Store {
  final _$highlightsErrorAtom = Atom(name: '_NewsStoreBase.highlightsError');

  @override
  String get highlightsError {
    _$highlightsErrorAtom.reportRead();
    return super.highlightsError;
  }

  @override
  set highlightsError(String value) {
    _$highlightsErrorAtom.reportWrite(value, super.highlightsError, () {
      super.highlightsError = value;
    });
  }

  final _$listErrorAtom = Atom(name: '_NewsStoreBase.listError');

  @override
  String get listError {
    _$listErrorAtom.reportRead();
    return super.listError;
  }

  @override
  set listError(String value) {
    _$listErrorAtom.reportWrite(value, super.listError, () {
      super.listError = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_NewsStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$fetchHighlightsAsyncAction =
      AsyncAction('_NewsStoreBase.fetchHighlights');

  @override
  Future fetchHighlights() {
    return _$fetchHighlightsAsyncAction.run(() => super.fetchHighlights());
  }

  final _$fetchArticlesAsyncAction =
      AsyncAction('_NewsStoreBase.fetchArticles');

  @override
  Future fetchArticles() {
    return _$fetchArticlesAsyncAction.run(() => super.fetchArticles());
  }

  final _$fetchAllAsyncAction = AsyncAction('_NewsStoreBase.fetchAll');

  @override
  Future fetchAll() {
    return _$fetchAllAsyncAction.run(() => super.fetchAll());
  }

  final _$_NewsStoreBaseActionController =
      ActionController(name: '_NewsStoreBase');

  @override
  dynamic setHighlightsError(String value) {
    final _$actionInfo = _$_NewsStoreBaseActionController.startAction(
        name: '_NewsStoreBase.setHighlightsError');
    try {
      return super.setHighlightsError(value);
    } finally {
      _$_NewsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setListError(String value) {
    final _$actionInfo = _$_NewsStoreBaseActionController.startAction(
        name: '_NewsStoreBase.setListError');
    try {
      return super.setListError(value);
    } finally {
      _$_NewsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$_NewsStoreBaseActionController.startAction(
        name: '_NewsStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_NewsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
highlightsError: ${highlightsError},
listError: ${listError},
isLoading: ${isLoading}
    ''';
  }
}
