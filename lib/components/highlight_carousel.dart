import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:getmobx_mesa_news/stores/news/article_store.dart';
import 'package:getmobx_mesa_news/stores/news/news_store.dart';

class HighlightCarousel extends StatefulWidget {
  final NewsStore news;
  HighlightCarousel({Key key, @required this.news}) : super(key: key);

  @override
  _HighlightCarouselState createState() => _HighlightCarouselState(news);
}

class _HighlightCarouselState extends State<HighlightCarousel> {
  final NewsStore news;
  _HighlightCarouselState(this.news);

  Widget _highlightView(ArticleStore article) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(
                article.content.imageUrl,
                height: 150,
                // width: 100,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Flexible(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  article.content.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 6,
                ),
                Observer(builder: (_) {
                  return IconButton(
                    color: Theme.of(context).primaryColor,
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
                })
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return CarouselSlider(
        options: CarouselOptions(
          height: 150,
          viewportFraction: 0.8,
          disableCenter: true,
          enableInfiniteScroll: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 10),
        ),
        items: news.filteredHighlights.map((art) => _highlightView(art)).toList(),
      );
    });
  }
}
