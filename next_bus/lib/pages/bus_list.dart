import 'package:flutter/material.dart';
import '../UI/main_scaffold.dart';
import '../UI/bus_display.dart';
import '../utils/bus_data.dart';
import '../utils/bus_time.dart';


class BusList extends StatefulWidget
{
  int _location;

  BusList(this._location);

  Bus six = new Bus();

  int get location => _location; //getter for location field

  //TODO: make a list of widgets to pass in to the Column's children field
  //this list will be a list of BusDisplay widgets, sorted by time
  //maybe 2 displays for each bus?

  // List<Widget> displayBuses = [
  //   // new BusDisplay(6, six.getNextBus('6', 1049)),
  //   // new BusDisplay(6, six.getNextBus('6', widget.six.getNextBus('6', 1049))),
  // ];
  final listOfHouseBuses = getListOfHouseBuses();

  final listOfUniBuses = getListOfUniBuses();

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
          children: widget.location == 0 ? widget.listOfHouseBuses : widget.listOfUniBuses //if location == 0, house was selected and the house buses are shown
          )
              // new Text("House", onTap: () => print("Pressed house!"), style: new TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 50.0)),
              // new Text("University", style: new TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 50.0))
        )
      );
  }
}

List<Widget> getListOfHouseBuses()
{
  Bus houseBus = new Bus();

  //load list with each bus and it's next time
  var listOfBusTimes = [
    new BusTime('6', houseBus.getNextBus('6', 1050, 0)),
    new BusTime('6', houseBus.getNextBus('6', 1049, 0))
  ];

  //sort the list by the time
  listOfBusTimes.sort((a, b) => a.busTime.compareTo(b.busTime));

  //load the widget list to be display with the previously sorted list of bus times
  List<Widget> listOfHouseBuses = [
    new BusDisplay(listOfBusTimes[0]),
    new BusDisplay(listOfBusTimes[1])
  ];
  return listOfHouseBuses;
}

List<Widget> getListOfUniBuses()
{
  Bus uniBus = new Bus();

  var listOfBusTimes = [
    new BusTime('6', uniBus.getNextBus('6', 1215, 1)),
    new BusTime('57U', uniBus.getNextBus('57U', 1215, 1)),
    new BusTime('58U', uniBus.getNextBus('58U', 1215, 1)),
    new BusTime('50U', uniBus.getNextBus('50U', 1215, 1))
  ];
  listOfBusTimes.sort((a, b) => a.busTime.compareTo(b.busTime));

  List<Widget> listOfUniBuses = [
    new BusDisplay(listOfBusTimes[0]),
    new BusDisplay(listOfBusTimes[1]),
    new BusDisplay(listOfBusTimes[2]),
    new BusDisplay(listOfBusTimes[3])
  ];

  return listOfUniBuses;
}