import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/weather.dart';
import 'package:weatherapp/constants/err_message.dart';
import 'package:weatherapp/provider/weather_provider.dart';
import 'package:weatherapp/screens/weather_screen.dart';


class LocationProvider with ChangeNotifier{
  TextEditingController cityController = TextEditingController();
  FocusNode cityFocusNode = FocusNode();

  Future<void> onPressed(context)async{
    if(cityController.text == ""){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(milliseconds: 10),
        backgroundColor: Colors.blue,
        content: 
        Text(ErrorMessage.noCity)),
      
      
     );
    }
    final weatherProvider =Provider.of<WeatherProvider>(context,listen:false);
     Weather weather=  await weatherProvider.getWeatherByCityName(cityController.text);
    print("Weather details:${weather}");

      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WeatherScreen(
        w: weather
        )));

  }
}