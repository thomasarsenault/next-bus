import 'package:flutter/material.dart';
import '../pages/bus_list.dart';

class MainScaffold extends StatelessWidget
{
  final Container _body;
  final String _title;

  MainScaffold(this._body, this._title);

  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(_title)
      ),
      drawer: Drawer(
        
      ),
      body: Center(
        child: _body
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: Colors.blue,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text("Home")
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.explore),
            title: new Text("House")
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.explore),
            title: new Text("University")
          )
        ]
      ),
    );
  }
}