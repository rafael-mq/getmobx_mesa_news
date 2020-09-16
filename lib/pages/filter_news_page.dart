import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:getmobx_mesa_news/components/custom_app_bar.dart';
import 'package:getmobx_mesa_news/stores/news/news_store.dart';

class FilterNews extends StatelessWidget {
  final news = Get.find<NewsStore>();

  Widget renderBody(NewsStore news) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Apenas favoritos",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Observer(builder: (_) {
                  return Switch(
                    value: news.filterFavorites,
                    onChanged: (value) => news.setFilterFavorites(value),
                  );
                }),
              ],
            ),
          ),
          Divider(
            thickness: 1.5,
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Data",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                DropdownButton(
                  value: 1,
                  items: [
                    DropdownMenuItem(child: Text("Hoje"), value: 0),
                    DropdownMenuItem(child: Text("Esta semana"), value: 1),
                    DropdownMenuItem(child: Text("Este mês"), value: 2),
                    DropdownMenuItem(child: Text("Sempre"), value: 3),
                  ],
                  onChanged: null,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: customAppBar(
            title: "Filtro",
            leading: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () => Get.back()),
          ),
          body: renderBody(news)),
    );
  }
}
