import 'package:flutter/material.dart';
import '../UI/main_scaffold.dart';
import './bus_list.dart';
import './home_page.dart';

class MenuPage extends StatefulWidget
{
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>
{
  DateTime _currentTime = DateTime.now();

  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    BusList(2),
    BusList(3),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("NextBus Beta")
      ),
      drawer: Drawer(
        
      ),
      body: Center(
        child: _children[_currentIndex]
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: switchPages,
        currentIndex: _currentIndex,
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

  void switchPages(int index)
  {
    setState(()
    {
      _currentIndex = index;
    });
  }
}