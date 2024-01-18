import 'package:flutter/material.dart';
import 'package:weatherapp/constants/app_constants.dart';
import 'package:weatherapp/constants/string_constants.dart';

class WeatherDetailCard extends StatelessWidget {
  final String title;
  final String information;
  final String img;


  const WeatherDetailCard({super.key,
  required this.title,
  required this.img,
  required this.information});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:80,
      padding:const EdgeInsets.all(12),
      margin:const EdgeInsets.only(top:20,right: 20,left:20),
      decoration:BoxDecoration(color: Colors.lightBlue,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
       BoxShadow( color: Colors.black,
      offset: Offset(0.4,0.2),
      blurRadius: 0.4,
      spreadRadius: 0.4
      )
      ],
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        
        title == StringConstants.weatherCondition?
        Image.network(AppConstants.baseImgUrl+img):
        Image.asset( img,height:40,width:40),
        SizedBox(width:40),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(title,
          style: TextStyle(fontWeight: FontWeight.w700,
          color: Colors.black,
          fontSize: 20),
          ),
          Text(information,
          textAlign: TextAlign.start,
          style: TextStyle(
            
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w500
          ),)

        ],)
      ],
      )
    );
  }
}