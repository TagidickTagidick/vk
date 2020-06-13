import 'package:flutter/material.dart';

class NewsOrDiscover extends StatefulWidget {
  @override
  _NewsOrDiscoverState createState() => _NewsOrDiscoverState();
}

class _NewsOrDiscoverState extends State<NewsOrDiscover> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold
      (
        appBar: new AppBar(
            title: new Text("NewsOrDiscover")
        ),
        body: new Center(
            child: new Text("Да")
        )
    );
  }
}