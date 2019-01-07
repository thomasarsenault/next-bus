import 'package:flutter/material.dart';
import '../UI/main_scaffold.dart';
import '../UI/bus_display.dart';
import '../utils/bus_data.dart';


class BusList extends StatefulWidget
{
  int _testNumber;

  BusList(this._testNumber);

  Bus six = new Bus(6);

  //TODO: make a list of widgets to pass in to the Column's children field
  //this list will be a list of BusDisplay widgets, sorted by time
  //maybe 2 displays for each bus?
  
  // List<Widget> displayBuses = [
  //   // new BusDisplay(6, six.getNextBus('6', 1049)),
  //   // new BusDisplay(6, six.getNextBus('6', widget.six.getNextBus('6', 1049))),
  // ];

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
              new BusDisplay(widget._testNumber, widget.six.getNextBus('6', 1049)), //temporary display of the next bus time
              new BusDisplay(widget._testNumber, widget.six.getNextBus('6', widget.six.getNextBus('6', 1049))), //temporary display of the next next bus time
            ]
          )
              // new Text("House", onTap: () => print("Pressed house!"), style: new TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 50.0)),
              // new Text("University", style: new TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 50.0))
        )
      );
  }
}