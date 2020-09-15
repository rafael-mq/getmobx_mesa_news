import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:getmobx_mesa_news/components/article_listview.dart';
import 'package:getmobx_mesa_news/components/custom_app_bar.dart';
import 'package:getmobx_mesa_news/components/highlight_carousel.dart';
import 'package:getmobx_mesa_news/components/loading_view.dart';
import 'package:getmobx_mesa_news/stores/login/login_store.dart';
import 'package:getmobx_mesa_news/stores/news/news_store.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final login = Get.find<LoginStore>();
  final news = Get.put(NewsStore());

  Widget renderBody(NewsStore news) {
    return Observer(builder: (_) {
      return Container(
        color: Colors.white,
        child: news.isLoading
            ? LoadingView()
            : Column(
                children: <Widget>[
                  HighlightCarousel(news: news),
                  articleListView(news),
                ],
              ),
      );
    });
  }

  @override
  void initState() {
    news.fetchAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: customAppBar(
          title: "Mesa News",
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.dehaze,
                  color: Colors.white,
                ),
                onPressed: null)
          ],
        ),
        body: renderBody(news),
      ),
    );
  }
}
