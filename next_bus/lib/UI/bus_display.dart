import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'dart:math';

import '../UI/main_scaffold.dart';
import '../utils/bus_time.dart';

class BusDisplay extends StatefulWidget
{
  // final int _busNumber;
  // final int _busTime;

  BusTime _busToDisplay;
  //BusDisplay(this._busNumber, this._busTime);
  BusDisplay(this._busToDisplay);

  @override
  _BusDisplayState createState() => _BusDisplayState();
}

class _BusDisplayState extends State<BusDisplay> with SingleTickerProviderStateMixin
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
  void didUpdateWidget(BusDisplay oldWidget)
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
        padding: new EdgeInsets.only(top: _fontSizeAnimation.value * 20, left: _fontSizeAnimation.value * 20, right: _fontSizeAnimation.value * 20),
        child: new Material(
          child: new Padding(
            padding: new EdgeInsets.all(_fontSizeAnimation.value * 10),
            child: new Row(
              children: <Widget>[
              new Icon(FontAwesomeIcons.bus, color: Colors.grey[600]),
              new Text("  " + widget._busToDisplay.busNumber.toString(), style: new TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 30.0)),
              new Expanded(
                child: new Text(getFormattedTime(widget._busToDisplay.busTime), textAlign: TextAlign.right, style: new TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 30.0))
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

Color randomColor()
{
  var randNumber = new Random();
  int next(int min, int max) => min + randNumber.nextInt(max - min);

  int rand = next(0, 3);
  switch(rand)
  {
    case 0: {
      return Colors.redAccent;
    }
    case 1: {
      return Colors.greenAccent;
    }
    case 2: {
      return Colors.orangeAccent;
    }
    case 3: {
      return Colors.purpleAccent;
    }
  }

  return Colors.blueAccent;
}