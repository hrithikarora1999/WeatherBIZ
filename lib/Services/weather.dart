import 'package:weather/Services/Location.dart';
import 'package:weather/Services/Networking.dart';

const ApiKey='f1fe4c76527683cb29ba2fcbe83a6fa0';

class WeatherModel {
  Future<dynamic> GetWeatherData() async
  {
    Location location=Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper=NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.Latitude}&lon=${location.Longitude}&units=metric&appid=$ApiKey');
    var decodeddata=await networkHelper.getData();
    return decodeddata;
  }
  Future<dynamic>GetWeatherDataByCity(String cityname) async{
    Location location=Location();
    print(cityname);
    //await location.getCurrentLocation();
    NetworkHelper networkHelper=NetworkHelper('https://api.openweathermap.org/data/2.5/weather?q=$cityname&units=metric&appid=$ApiKey');
    var decodeddata=await networkHelper.getData();
    return decodeddata;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s time for 🍦';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
