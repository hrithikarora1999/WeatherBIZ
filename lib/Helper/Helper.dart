
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({this.colour,this.colour1,this.icon});
  final Color colour;
  final Color colour1;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 180,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              colour,
              colour1
            ]
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('18:00',style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w500),),
          icon,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('12',style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w500,),),
              Text('°',style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w500),),
            ],
          ),
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  ReusableRow({this.Humidity,this.Wind,this.humidity,this.windspeed});
  final humidity;
  final windspeed;
  final Wind;
  final Humidity;


  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(Wind,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w800,color: Colors.black),),
        Text('$windspeed',style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w500,color: Colors.grey),),
        Text(Humidity,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w800),),
        Text('$humidity',style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w500,color: Colors.grey),),
      ],
    );
  }
}
