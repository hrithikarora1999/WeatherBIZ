import 'package:geolocator/geolocator.dart';

class Location{
  double Latitude;
  double Longitude;
  Future<void> getCurrentLocation() async{
    Position position=await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    Latitude=position.latitude;
    Longitude=position.longitude;
  }
}