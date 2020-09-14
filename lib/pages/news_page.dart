import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  Widget renderBody() {
    return Container(
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Mesa News"),
          centerTitle: true,
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
