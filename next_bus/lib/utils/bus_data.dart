class Bus
{
  //bus six as strings
  // var six = [
  //   '548', '619', '649', '720', '740', '800', '820', '840', '900', '920', '940', '1000', '1020', '1050', '1120', '1150', '1220', '1250', '1320', '1350', '1422',
  //   '1442', '1502', '1522', '1542', '1602', '1622', '1642', '1702', '1722', '1742', '1802', '1819', '1849', '1919', '1949', '2019', '2049', '2119', '2149',
  //   '2219', '2249', '2319', '2349', '19'
  // ];


  //a Map to store each bus and their schedules
  var listOfBuses = {
    '6': [548, 619, 649, 720, 740, 800, 820, 840, 900, 920, 940, 1000, 1020, 1050, 1120, 1150, 1220, 1250, 1320, 1350, 1422,
        1442, 1502, 1522, 1542, 1602, 1622, 1642, 1702, 1722, 1742, 1802, 1819, 1849, 1919, 1949, 2019, 2049, 2119, 2149,
        2219, 2249, 2319, 2349, 19]
  };
  

  final int _busNumber;

  Bus(this._busNumber);

  void printTime()
  {
    var time = new StringBuffer();
    time.write("Time: ");
    time.write(DateTime.now().hour.toString());
    time.write(DateTime.now().minute.toString());

    print("Bus 6: " + listOfBuses['6'].toString());
  }

  int getNextBus(String busNumber, int testTime)
  {
    //testTime is currently useless but still there to input custom times instead of using the current DateTime
    var currentTime = new StringBuffer();

    //build a string to be in the format of HHMM, for example 1:20PM will be converted to 1320
    currentTime.write(DateTime.now().hour.toString());
    currentTime.write(DateTime.now().minute.toString());

    for(var busTime in listOfBuses[busNumber]) //loop through every time in the selected bus' schedule, from earliest to latest
    {
      //find the time that's greater than the current time (so which bus comes next)
      if(int.parse(currentTime.toString()) < busTime)
      //if(testTime < busTime)
        return busTime;
    }
    return 0;

  }
}
