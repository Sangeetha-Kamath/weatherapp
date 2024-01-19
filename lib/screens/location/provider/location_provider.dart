import 'package:country_state_city/country_state_city.dart';
import 'package:flutter/material.dart';

import 'package:weatherapp/constants/err_message.dart';

import 'package:weatherapp/screens/weather/weather_screen.dart';


class LocationProvider with ChangeNotifier{
  TextEditingController cityController = TextEditingController();
  FocusNode cityFocusNode = FocusNode();
  int selectedIndex = -1;
  List<City> cities = [];
   


    void onSelected(int index){
      selectedIndex = index;
      notifyListeners();
    }

  Future<List<City>> getCityList()async{
   cities =  await getStateCities('IN','KA'); 
   return cities;
  }

  Future<void> onPressed(context)async{

    if(cityController.text == "" &&selectedIndex == -1){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(milliseconds: 10),
        backgroundColor: Colors.blue,
        content: 
        Text(ErrorMessage.noCity)),
      
      
     );
    }else{
    

      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WeatherScreen(
        cityName: cityController.text.isEmpty?cities[selectedIndex].name:cityController.text,
       
        )));


    
    }
    
    

  
  }
 
  



}//class close