import 'package:flutter/material.dart';
import '../UI/main_scaffold.dart';

class BusDisplay extends StatefulWidget
{
  final int _busNumber;
  final int _busTime;

  BusDisplay(this._busNumber, this._busTime);

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
            child: new Row(children: <Widget>[
              new Icon(Icons.explore, color: Colors.white), //TODO: change this to an actual bus icon
              new Text("  " + widget._busNumber.toString() + "          " + widget._busTime.toString(), style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0))
            ],)
          )
        )
      )
    );
  }
}