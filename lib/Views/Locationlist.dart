
import 'package:flutter/material.dart';
import 'package:weather/Services/weather.dart';
import 'package:weather/Views/HomePage.dart';

class LocationList extends StatefulWidget {
  @override
  _LocationListState createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  String cityname;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(child: Text('GET WEATHER',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w500,color: Colors.deepPurple),)),
              SizedBox(height: 6.0,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter City/Country',
                  filled: true,
                  fillColor: Colors.white,
                  icon: Icon(Icons.location_city,color: Colors.white,),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )
                ),
                onChanged: (value){
                  cityname=value;
                },
              ),
              FlatButton(
                child: Text('Get Weather Info',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600),),
                color: Colors.deepPurple,
                onPressed: () async {
                  WeatherModel weather=WeatherModel();
                  var WeatherData=await weather.GetWeatherDataByCity(cityname);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Weather(WeatherData: WeatherData,)));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
