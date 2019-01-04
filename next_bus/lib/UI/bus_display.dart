import 'package:flutter/material.dart';
import '../UI/main_scaffold.dart';

class BusDisplay extends StatefulWidget
{
  final int _busNumber;

  BusDisplay(this._busNumber);

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
    super.dispose();
    _fontSizeAnimationController.dispose();
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
            child: new Row(children: <Widget>[
              new Icon(Icons.explore, color: Colors.white), //TODO: change this to an actual bus icon
              new Text("  " + widget._busNumber.toString(), style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0))
            ],)
          )
        )
      )
    );
  }
}