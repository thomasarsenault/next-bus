import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      child: new Padding(
        padding: new EdgeInsets.only(top: _fontSizeAnimation.value * 20, left: _fontSizeAnimation.value * 20, right: _fontSizeAnimation.value * 20),
        child: new Material(
          color: Colors.blueAccent,
          child: new Padding(
            padding: new EdgeInsets.all(_fontSizeAnimation.value * 20),
            child: new Row(
              children: <Widget>[
              new Icon(FontAwesomeIcons.bus, color: Colors.white), //TODO: change this to an actual bus icon
              new Text("  " + widget._busToDisplay.busNumber.toString(), style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0)),
              new Expanded(
                child: new Text(getFormattedTime(widget._busToDisplay.busTime), textAlign: TextAlign.right, style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0))
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
  var timeString = time.toString();
  var formattedTime = new StringBuffer();
  if(timeString.length == 3)
  {
    formattedTime.write(timeString[0]);
    formattedTime.write(":");
    formattedTime.write(timeString[1]);
    formattedTime.write(timeString[2]);
  }
  else
  {
    formattedTime.write(timeString[0]);
    formattedTime.write(timeString[1]);
    formattedTime.write(":");
    formattedTime.write(timeString[2]);
    formattedTime.write(timeString[3]);
  }

  return formattedTime.toString();
}