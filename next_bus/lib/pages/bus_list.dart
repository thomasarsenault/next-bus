import 'package:flutter/material.dart';
import '../UI/main_scaffold.dart';
import '../UI/bus_display.dart';

class BusList extends StatefulWidget
{
  int _testNumber;

  BusList(this._testNumber);

  @override
  _BusListState createState() => _BusListState();
}

class _BusListState extends State<BusList> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Material(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
              new BusDisplay(widget._testNumber),
              new BusDisplay(widget._testNumber),
              new BusDisplay(widget._testNumber),
              new BusDisplay(widget._testNumber),
              new BusDisplay(widget._testNumber),
              new BusDisplay(widget._testNumber)
            ]
          )
              // new Text("House", onTap: () => print("Pressed house!"), style: new TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 50.0)),
              // new Text("University", style: new TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 50.0))
        )
      );
  }
}