import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/weather.dart';
import 'package:weatherapp/constants/app_constants.dart';
import 'package:weatherapp/constants/string_constants.dart';
import 'package:weatherapp/screens/location/provider/location_provider.dart';


import 'package:weatherapp/screens/weather/weather_screen.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final locProvider = Provider.of<LocationProvider>(context,listen: false);
   
   
    return  Scaffold(
      appBar: AppBar(title: Text(StringConstants.locationScreen),
      backgroundColor: Colors.blue,),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
          controller: locProvider.cityController,
          focusNode: locProvider.cityFocusNode,
          decoration: InputDecoration(
            
            
            border: OutlineInputBorder(borderSide:BorderSide(color:Colors.black) ),
            focusedBorder: OutlineInputBorder(borderSide:BorderSide(color:Colors.black) ),

            label: Text(StringConstants.cityName,
            style: TextStyle(color: Colors.black),),
        
        ),
            ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
      onPressed: () { 
        locProvider.onPressed(context);

       },
      child:Icon(Icons.arrow_right_sharp,)));
  }
}