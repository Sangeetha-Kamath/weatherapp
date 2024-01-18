import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

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
        backgroundColor: Colors.blue,)
      //body: 
     // Text(w.date.toString())
      );
  }
}