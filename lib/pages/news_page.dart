import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:getmobx_mesa_news/components/article_listview.dart';
import 'package:getmobx_mesa_news/components/custom_app_bar.dart';
import 'package:getmobx_mesa_news/components/highlight_carousel.dart';
import 'package:getmobx_mesa_news/components/loading_view.dart';
import 'package:getmobx_mesa_news/pages/filter_news_page.dart';
import 'package:getmobx_mesa_news/stores/login/login_store.dart';
import 'package:getmobx_mesa_news/stores/news/news_store.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final login = Get.find<LoginStore>();
  final news = Get.put(NewsStore());

  @override
  void initState() {
    news.fetchAll();
    super.initState();
  }

  Widget renderBody(NewsStore news) {
    return Observer(builder: (_) {
      return Container(
        margin: EdgeInsets.all(15),
        child: news.isLoading
            ? LoadingView()
            : Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Destaques",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  HighlightCarousel(news: news),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Últimas notícias",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  ArticleListView(news: news),
                ],
              ),
      );
    });
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
                onPressed: () => Get.to(FilterNews()))
          ],
        ),
        body: renderBody(news),
      ),
    );
  }
}
