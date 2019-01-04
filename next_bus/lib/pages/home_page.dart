import 'package:flutter/material.dart';

import './university.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("NextBus Beta")
      ),
      drawer: Drawer(
        
      ),
      body: Center(
        child: new Container(
          child: new Material(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Text("Where are you?", style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40.0)),
                new RaisedButton(
                  padding: new EdgeInsets.all(60.0),
                  child: new Text("House", style: new TextStyle(color: Colors.white, fontSize: 25.0)),
                  onPressed: () => print("House!"), color: Colors.blue),
                new RaisedButton(
                  padding: new EdgeInsets.all(60.0),
                  child: new Text("University",
                  style: new TextStyle(color: Colors.white, fontSize: 25.0)), onPressed: () => print("University!"), color: Colors.blue)
                ]
              )
                  // new Text("House", onTap: () => print("Pressed house!"), style: new TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 50.0)),
                  // new Text("University", style: new TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 50.0))
            )
        )
      ),
    
    );
  }
}