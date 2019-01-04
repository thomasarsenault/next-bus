import 'package:flutter/material.dart';
import '../UI/main_scaffold.dart';
import './bus_list.dart';

class Home extends StatelessWidget {

  // @override
  // Widget build(BuildContext context) {
  //   return MainScaffold(new Container(
  //                         child: new Material(
  //                           child: new Column(
  //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                             children: <Widget>[
  //                               new Text("Where are you?", style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40.0)),
  //                               new ButtonTheme(
  //                                 minWidth: 250.0,
  //                                 height: 100.0,
  //                                 child: new RaisedButton(
  //                                 padding: new EdgeInsets.all(60.0),
  //                                 child: new Text("House", style: new TextStyle(color: Colors.white, fontSize: 25.0)),
  //                                 onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new BusList())), color: Colors.blue)
  //                               ),
  //                               new ButtonTheme(
  //                                 minWidth: 250.0,
  //                                 height: 100.0,
  //                                 child: new RaisedButton(
  //                                 padding: new EdgeInsets.all(60.0),
  //                                 child: new Text("University",
  //                                 style: new TextStyle(color: Colors.white, fontSize: 25.0)), onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new BusList())), color: Colors.blue)
  //                               )
  //                               ]
  //                             )
  //                                 // new Text("House", onTap: () => print("Pressed house!"), style: new TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 50.0)),
  //                                 // new Text("University", style: new TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 50.0))
  //                           )
  //       ), "NextBus Beta");
  // }

  Widget build(BuildContext context)
  {
    return new Container(
      child: new Text("Home page!")
    );
  }
}

