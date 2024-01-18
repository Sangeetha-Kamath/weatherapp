import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weatherapp/constants/img_constants.dart';
import 'package:weatherapp/constants/string_constants.dart';
import 'package:weatherapp/screens/weather/component/temp_component.dart';
import 'package:weatherapp/screens/weather/component/weather_detail_component.dart';

class WeatherScreen extends StatelessWidget {
  final Weather w;
  const WeatherScreen({super.key,
  required this.w
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(

        title: Text("Weather Details"),
        backgroundColor: Colors.blue,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WeatherDetailCard(title: StringConstants.city, information: w.areaName.toString(), img: ImageConstants.city,),
            WeatherDetailCard(title: StringConstants.currentTemperature, information: w.temperature.toString(), img: ImageConstants.temperature,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              TempComponent(title: StringConstants.minTemp, temp: w.tempMin.toString()),
               TempComponent(title: StringConstants.maxTemp, temp: w.tempMax.toString())
            ],),
            WeatherDetailCard(title: StringConstants.weatherCondition, img: "${w.weatherIcon}.png", information: w.weatherDescription.toString()),
            WeatherDetailCard(title:StringConstants.humidity,img: ImageConstants.humidity,information: w.humidity.toString(),),
            WeatherDetailCard(title: StringConstants.windSpeed, img: ImageConstants.windSpeed, information: w.windSpeed.toString()),
            
            
        
          ],
        ),
      )
     // Text(w.date.toString())
      );
  }
}