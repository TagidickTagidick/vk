import 'package:flutter/material.dart';

class Clips extends StatefulWidget {
  @override
  _ClipsState createState() => _ClipsState();
}

class _ClipsState extends State<Clips> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold
      (
        appBar: new AppBar(
            title: new Text("Clips")
        ),
        body: new Center(
            child: new Text("Да")
        )
    );
  }
}