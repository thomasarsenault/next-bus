import 'package:flutter/material.dart';
import '../UI/main_scaffold.dart';
import '../UI/bus_display.dart';
import '../UI/bus_list_display.dart';
import '../utils/bus_data.dart';
import '../utils/bus_time.dart';


class ListOfBusTimes extends StatefulWidget
{
  final String _busNumber;
  final int _location;
  ListOfBusTimes(this._busNumber, this._location);


  //TODO: make a list of widgets to pass in to the Column's children field
  //this list will be a list of BusDisplay widgets, sorted by time
  //maybe 2 displays for each bus?

  // List<Widget> displayBuses = [
  //   // new BusDisplay(6, six.getNextBus('6', 1049)),
  //   // new BusDisplay(6, six.getNextBus('6', widget.six.getNextBus('6', 1049))),
  // ];
  
  @override
  _ListOfBusTimesState createState() => _ListOfBusTimesState();
}

class _ListOfBusTimesState extends State<ListOfBusTimes> {
  
  Widget build(BuildContext context)
  {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Bus " + widget._busNumber)
      ),
      drawer: Drawer(
        
      ),
      body: SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: getListOfBusTimes(widget._busNumber, widget._location)
          )
      ),
    );
  }
}

List<Widget> getListOfBusTimes(String busNumber, int location)
{
  Bus newBus = new Bus();
  List<BusListDisplay> listOfTimes = new List<BusListDisplay>();

  if(location == 0)
  {
    for(int time in newBus.listOfHouseBuses[busNumber])
    {
      listOfTimes.add(new BusListDisplay(time));
    }
  }
  else
  {
    print(newBus.listOfUniBuses[busNumber].length);
    int counter = 0;
    for(int time in newBus.listOfUniBuses[busNumber])
    {
      counter++;
      print(counter.toString());
      if(time != null)
        listOfTimes.add(new BusListDisplay(time));
      print(time.toString() + "\n");
    }
  }

  return listOfTimes;

}
