import 'package:flutter/material.dart';

class TempComponent extends StatelessWidget {
  final String title;
  final String temp;
  const TempComponent({super.key,
  required this.title,
  required this.temp});

  @override
  Widget build(BuildContext context) {
    return 
     Container(
      height:80,
      
      padding:const EdgeInsets.all(12),
      margin: const EdgeInsets.only(right:20, left:20, top:20,),
      
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
    child:  Column(children: [ Text(title,
          style: TextStyle(fontWeight: FontWeight.w700,
          color: Colors.black,
          fontSize: 20),
          ),
          Text(temp,
          textAlign: TextAlign.start,
          style: TextStyle(
            
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w500
          ),)],)

    );
  }
}