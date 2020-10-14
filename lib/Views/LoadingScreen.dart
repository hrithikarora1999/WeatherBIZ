
import 'package:flutter/material.dart';
import 'package:weather/Services/weather.dart';
import 'package:weather/Views/HomePage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}


class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  WeatherModel weather=WeatherModel();
  void GetLocationDatabycord() async
  {
    var Weatherdata=await weather.GetWeatherData();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Weather(WeatherData: Weatherdata,)));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetLocationDatabycord();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitFadingCube(
        color: Colors.lightGreen,
        size: 100.0,
      ),
    );
  }
}
