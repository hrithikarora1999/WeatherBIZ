
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/Helper/Helper.dart';
import 'package:weather/Services/Location.dart';
import 'package:weather/Services/Networking.dart';
import 'package:weather/Services/weather.dart';
const ApiKey='f1fe4c76527683cb29ba2fcbe83a6fa0';
class Weather extends StatefulWidget {
  Weather({this.WeatherData});
  final WeatherData;
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  WeatherModel weather=WeatherModel();
  int currenttemp;
  String cityname;
  String WeatherType;
  int humidity;
  int windspeed;
  String WeatherIcon;
  String WeatherMessage;
  int visibility;
  int pressure;

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    print(widget.WeatherData);
    updateUI(widget.WeatherData);
  }
  void updateUI(dynamic WeatherData)
  {
    var temp=WeatherData["main"]["temp"];
    currenttemp=temp.toInt();
    cityname=WeatherData["name"];
    WeatherType=WeatherData["weather"][0]["main"];
    var humid=WeatherData["main"]["humidity"];
    humidity=humid.toInt();
    var winds=WeatherData["wind"]["speed"];
    windspeed=winds.toInt();
    var condition=WeatherData["weather"][0]["id"];
    WeatherIcon=weather.getWeatherIcon(condition);
    WeatherMessage=weather.getMessage(currenttemp);
    visibility=WeatherData["visibility"];
    pressure=WeatherData["main"]["pressure"];
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [BoxShadow(color: Colors.white,offset: Offset(3,3),blurRadius: 1.0,spreadRadius: 2.0)],
                ),
                margin: EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                              GestureDetector(onTap:() {

                              },child: Image(image: AssetImage('images/logo.png'),width: 80,height: 100,)),

                            Text('Weather Forecast',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w700,letterSpacing: 1.2,color: Colors.black87,
                              fontFamily:'Roboto Slab',),),
                            FlatButton(onPressed:()  {
                                Navigator.pushNamed(context, '/first');
                              },child: Icon(Icons.near_me,size: 20.0,)),

                            Expanded(
                              child: FlatButton(onPressed: () async {
                                var WeatherData=await weather.GetWeatherData();
                               
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Weather(WeatherData: WeatherData,)));
                              },
                                  child: Icon(Icons.my_location,size: 20.0,)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(WeatherIcon,style: TextStyle(fontSize: 45.0,),),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('$currenttemp',style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold,),),
                                Text('°',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(WeatherType,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500,),),
                              Text(cityname,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500,),),
                              SizedBox(height: 6.0,),
                              Text(WeatherMessage,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500,letterSpacing: 1.2),overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 13.0,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Today',style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w500,),),
                          Text('Tomorrow',style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w500),),
                          Text('After',style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ReusableCard(colour: Colors.deepOrangeAccent,colour1: Colors.redAccent,icon: Icon(Icons.filter_drama,size: 30.0,),),
                          ReusableCard(colour: Colors.purpleAccent,colour1: Colors.deepPurple,icon: Icon(Icons.wb_sunny,size: 30.0,),),
                          ReusableCard(colour: Colors.lightGreen,colour1: Colors.green,icon: Icon(Icons.cloud,size: 30.0,),),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Text('Additional Info',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ReusableRow(humidity:humidity ,windspeed:windspeed ,Humidity: "Humidity",Wind: "Wind",),
                              ReusableRow(humidity:pressure,windspeed: visibility,Humidity: "Pressure",Wind: "Visibility",),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        image:
                        DecorationImage(
                          image: AssetImage('images/weather1.png')
                        )
                      ),
                    ),
                    Container(
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.home,size:24.0,color: Colors.grey,),
                                  SizedBox(width: 8.0,),
                                  Text('Home',style: TextStyle(fontSize: 15.0,fontWeight:FontWeight.w300,color: Colors.grey[800]),)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(Icons.wb_cloudy,size:24.0,color: Colors.black,),
                                  SizedBox(width: 8.0,),
                                  Icon(Icons.settings,size:24.0,color: Colors.grey[400],),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}



