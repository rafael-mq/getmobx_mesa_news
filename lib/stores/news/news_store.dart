import 'package:mobx/mobx.dart';
part 'news_store.g.dart';

class NewsStore = _NewsStoreBase with _$NewsStore;

abstract class _NewsStoreBase with Store {}
