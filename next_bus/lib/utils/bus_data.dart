class Bus
{
  //bus six as strings
  // var six = [
  //   '548', '619', '649', '720', '740', '800', '820', '840', '900', '920', '940', '1000', '1020', '1050', '1120', '1150', '1220', '1250', '1320', '1350', '1422',
  //   '1442', '1502', '1522', '1542', '1602', '1622', '1642', '1702', '1722', '1742', '1802', '1819', '1849', '1919', '1949', '2019', '2049', '2119', '2149',
  //   '2219', '2249', '2319', '2349', '19'
  // ];


  //a Map to store each bus and their schedules
  var listOfHouseBuses = {
    '6': [548, 619, 649, 720, 740, 800, 820, 840, 900, 920, 940, 1000, 1020, 1050, 1120, 1150, 1220, 1250, 1320, 1350, 1422,
        1442, 1502, 1522, 1542, 1602, 1622, 1642, 1702, 1722, 1742, 1802, 1819, 1849, 1919, 1949, 2019, 2049, 2119, 2149,
        2219, 2249, 2319, 2349, 19]
  };

  var listOfUniBuses = {
    '6': [600,	630,	700,	720,	740,	800,	820,	840,	900,	920,	940,	1000,	1030,	1100,	1130,	1200,	1230,	1300,	1330,	1400,	1420,	1440,	1500,	1520,
          1540,	1600,	1620,	1640,	1700,	1720,	1740,	1800,	1830,	1900,	1930,	2000,	2030,	2100,	2130,	2200,	2230,	2300,	2330,	2400,	30],
    '57U': [800,	820,	840,	900,	920,	940, 1000,	1020,	1040,	1100,	1120,	1140,	1200,	1220,	1240,	1300,	1320,	1340,	1400,
          1420,	1440,	1500,	1520,	1540,	1600,	1620,	1640,	1700,	1720,	1740,	1800,	1820,	1840,	1900,	1920,	1940,	2000,	2020,	2040,	2100,	2120,	2140,	2200,	2220],
    '58U': [720,	740,	800,	820,	840,	900,	920,	940,	1000,	1020,	1040,	1100,	1120,	1140,	1200,	1220,	1240,	1300,	1320,	1340,	1400,	1420,	1440,	1500,
          1520,	1540,	1600,	1620,	1640,	1700,	1720,	1740,	1800,	1820,	1840,	1900,	1920,	1940,	2000,	2020,	2040,	2100,	2120,	2140,	2200],
    '50U': [810, 830,	850,	910,	930, 950,	1010,	1030,	1050,	1110,	1130,	1150,	1210,	1230,	1250,	1310,	1330,	1350,	1410,	1430,	1450,	1510,	1530,	1550,	1610,	1630,	1650,	1710,	1730,	1750,	1810,	1830,	1850,	1910,	1930,
          1950,	2010,	2030,	2050,	2110,	2130,	2150,	2210,]
  };


  void printTime()
  {
    var time = new StringBuffer();
    time.write("Time: ");
    time.write(DateTime.now().hour.toString());
    time.write(DateTime.now().minute.toString());

    print("Bus 6: " + listOfHouseBuses['6'].toString());
  }

  int getNextBus(String busNumber, int testTime, int location)
  {
    //testTime is currently useless but still there to input custom times instead of using the current DateTime
    var currentTime = new StringBuffer();

    //build a string to be in the format of HHMM, for example 1:20PM will be converted to 1320
    currentTime.write(DateTime.now().hour.toString());
    currentTime.write(DateTime.now().minute.toString());

    for(var busTime in location == 0 ? listOfHouseBuses[busNumber] : listOfUniBuses[busNumber]) //loop through every time in the selected bus' schedule, from earliest to latest
    {
      //find the time that's greater than the current time (so which bus comes next)
      if(int.parse(currentTime.toString()) < busTime)
      //if(testTime < busTime)
        return busTime;
    }
    return 0;

  }
}
