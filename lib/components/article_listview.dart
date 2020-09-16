import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:getmobx_mesa_news/stores/news/article_store.dart';
import 'package:getmobx_mesa_news/stores/news/news_store.dart';

class ArticleListView extends StatelessWidget {
  final NewsStore news;
  ArticleListView({Key key, @required this.news}) : super(key: key);

  Widget _articleView(ArticleStore article) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      // height: 50,
      // width: 50,
      // color: Colors.green,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(
              article.content.imageUrl,
              height: 150,
              fit: BoxFit.fitWidth,
              errorBuilder: (_, error, __) => Text('😢'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Observer(builder: (context) {
                return IconButton(
                  color: Theme.of(context).primaryColor,
                  padding: EdgeInsets.all(1.0),
                  // visualDensity: VisualDensity.compact,
                  icon: article.favorite
                      ? Icon(
                          Icons.bookmark,
                          color: Theme.of(context).primaryColor,
                        )
                      : Icon(
                          Icons.bookmark_border,
                          color: Theme.of(context).primaryColor,
                        ),
                  onPressed: () => article.setFavorite(!article.favorite),
                );
              }),
              Text("2 horas atrás")
            ],
          ),
          Text(
            article.content.title,
            style: TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          SizedBox(height: 10.0),
          Text(
            article.content.description,
            style: TextStyle(fontSize: 12.0),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Flexible(
        child: RefreshIndicator(
          onRefresh: () => news.fetchArticles(),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: news.filteredArticles.length,
            itemBuilder: (_, index) {
              final article = news.filteredArticles[index];
              return _articleView(article);
            },
          ),
        ),
      );
    });
  }
}
