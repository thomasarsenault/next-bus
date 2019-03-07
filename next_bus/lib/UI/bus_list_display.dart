import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../UI/main_scaffold.dart';
import '../utils/bus_time.dart';
import '../pages/bus_times.dart';
import '../utils/bus_data.dart';


//TODO: add weekend busses
//TODO: fix indexing error when printing all bus times


class BusListDisplay extends StatefulWidget
{
  // final int _busNumber;
  // final int _busTime;

  int _busTime;
  //BusDisplay(this._busNumber, this._busTime);
  BusListDisplay(this._busTime);

  @override
  _BusListDisplayState createState() => _BusListDisplayState();
}

class _BusListDisplayState extends State<BusListDisplay> with SingleTickerProviderStateMixin
{
  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAnimationController;

  @override
  void initState()
  {
    super.initState();
    _fontSizeAnimationController = new AnimationController(duration: new Duration(milliseconds: 500), vsync: this);
    _fontSizeAnimation = new CurvedAnimation(parent: _fontSizeAnimationController, curve: Curves.easeOut);
    _fontSizeAnimation.addListener(() => this.setState( () {} ));
    _fontSizeAnimationController.forward();
  }

  @override
  void dispose()
  {
    //super class ticker must be disposed last, else an exception is thrown
    _fontSizeAnimationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(BusListDisplay oldWidget)
  {
    //makes sure the animation works every time a new bus display is called
    //before this, selecting House and then University would not reload the animation
    super.didUpdateWidget(oldWidget);
    _fontSizeAnimationController.reset();
    _fontSizeAnimationController.forward();
  }

  @override
  Widget build(BuildContext context)
  {
    return Container(
      // decoration: const BoxDecoration(
      //   border: Border(
      //     top: BorderSide(width: 1.0, color: Colors.grey),
      //     bottom: BorderSide(width: 1.0, color: Colors.grey)
      //   )
      // ),
      child: new Padding(
        padding: new EdgeInsets.only(top: _fontSizeAnimation.value * 10, left: _fontSizeAnimation.value * 20, right: _fontSizeAnimation.value * 20),
        child: new RaisedButton(
          onPressed: () {},
          child: new Padding(
            padding: new EdgeInsets.all(_fontSizeAnimation.value * 5),
            child: new Row(
              children: <Widget>[
              new Expanded(
                child: new Text(getFormattedTime(widget._busTime), textAlign: TextAlign.center, style: new TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 30.0))
              )
            ],)
          )
        )
      )
    );
  }
}

String getFormattedTime(int time)
{
  bool timePM = false;
  if(time >= 2800) //if the next bus is coming in the morning
  {
    time -= 2400;
  }
  else if(time >= 1200)
  {
    timePM = true;
    if(time >= 1300)
      time -= 1200;
  }
  var timeString = time.toString();
  var formattedTime = new StringBuffer();
  if(timeString.length == 3)
  {
    formattedTime.write(timeString[0]);
    formattedTime.write(":");
    formattedTime.write(timeString[1]);
    formattedTime.write(timeString[2]);
    formattedTime.write((timePM) ? " pm" : " am");
  }
  else
  {
    formattedTime.write(timeString[0]);
    formattedTime.write(timeString[1]);
    formattedTime.write(":");
    formattedTime.write(timeString[2]);
    formattedTime.write(timeString[3]);
    formattedTime.write((timePM) ? " pm" : " am");
  }

  return formattedTime.toString();
}