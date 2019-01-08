import 'package:flutter/material.dart';
import './pages/menu_page.dart';
import './pages/bus_list.dart';
import './utils/bus_data.dart';


void main(args)
{
  runApp(new MaterialApp(
    home: new MenuPage()
  ));

  Bus temp = new Bus();
  temp.printTime();
  int nextBus;
  nextBus = temp.getNextBus('6', 1049, 0);
  print(nextBus);
  print(temp.getNextBus('6', nextBus, 0));
}