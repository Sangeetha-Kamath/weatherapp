import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/weather.dart';
import 'package:weatherapp/constants/err_message.dart';
import 'package:weatherapp/constants/img_constants.dart';
import 'package:weatherapp/constants/string_constants.dart';
import 'package:weatherapp/screens/weather/component/temp_component.dart';
import 'package:weatherapp/screens/weather/component/weather_detail_component.dart';
import 'package:weatherapp/screens/weather/provider/weather_provider.dart';

class WeatherScreen extends StatelessWidget {
final String cityName;
  const WeatherScreen({super.key,
  required this.cityName

  });

  @override
  Widget build(BuildContext context) {
    final wProvider = Provider.of<WeatherProvider>(context,listen:false);
    return  Scaffold(
    
      appBar: AppBar(
    
        title: Text("Weather Details"),
        backgroundColor: Colors.blue,),
      body: FutureBuilder<dynamic>(
        future:wProvider.getWeatherByCityName(cityName),
        builder: (context,snapshot) {
          if(snapshot.hasData){
              return SingleChildScrollView(
            child: Column(
              children: [
                WeatherDetailCard(title: StringConstants.city, information: snapshot.data.areaName.toString(), img: ImageConstants.city,),
                WeatherDetailCard(title: StringConstants.currentTemperature, information: snapshot.data.temperature.toString(), img: ImageConstants.temperature,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  TempComponent(title: StringConstants.minTemp, temp:snapshot.data.tempMin.toString()),
                   TempComponent(title: StringConstants.maxTemp, temp: snapshot.data.tempMax.toString())
                ],),
                WeatherDetailCard(title: StringConstants.weatherCondition, img: "${snapshot.data.weatherIcon}.png", information: snapshot.data.weatherDescription.toString()),
                WeatherDetailCard(title:StringConstants.humidity,img: ImageConstants.humidity,information: snapshot.data.humidity.toString(),),
                WeatherDetailCard(title: StringConstants.windSpeed, img: ImageConstants.windSpeed, information: snapshot.data.windSpeed.toString()),
                
                
            
              ],
            ),
          );
          }else if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          
          }else{

            return Center(child: Text(ErrorMessage.noData));
          }
          
        }
      )
     // Text(w.date.toString())
      );
  }
}