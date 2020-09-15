import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getmobx_mesa_news/components/custom_app_bar.dart';
import 'package:getmobx_mesa_news/stores/login/login_store.dart';
import 'package:getmobx_mesa_news/stores/news/news_store.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final store = Get.put(LoginStore());

  Widget renderBody() {
    return Container(
      color: Colors.white,
    );
  }

  @override
  void initState() {
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
        body: renderBody(),
      ),
    );
  }
}
