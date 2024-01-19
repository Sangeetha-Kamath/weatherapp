
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/constants/string_constants.dart';
import 'package:weatherapp/screens/location/provider/location_provider.dart';




class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
   


   


   
   
    return  Consumer<LocationProvider>(
      builder: (context,locProvider,data) {
        return Scaffold(
          appBar: AppBar(title: Text(StringConstants.locationScreen),
          backgroundColor: Colors.blue,),
          body: Column(
            children: [
              Padding(
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
              Expanded(
                child: FutureBuilder<dynamic>(future: locProvider.getCityList(), 
                builder: (context, snapshot){
                  if(snapshot.hasData){
                  return   ListView.separated(
                 separatorBuilder: (context, index){
                    return _seperator(context);
                 } ,
                 itemCount: locProvider.cityList.length,
                 itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      locProvider.onSelected(index);
                    },
                    child: Container(
                      color: locProvider.selectedIndex == index?
                      Colors.lightGreen:Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(locProvider.cityList[index].name),
                      ),
                    ),
                  );
                
                 },);
                  }else if(snapshot.connectionState == ConnectionState.waiting){
                   return Center(child: CircularProgressIndicator());
                  }else{
                    return Text("No Data Found");
                  }
        
                })
               
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
          onPressed: () { 
            locProvider.onPressed(context);
        
           },
          child:Icon(Icons.arrow_right_sharp,)),
          
        );
      }
    );
  }
}
Widget _seperator(context){
  return Divider(color: Colors.black,
  thickness: 2,);
}