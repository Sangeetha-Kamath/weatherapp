import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_weatherapp/screens/location/location_screen.dart';
import 'package:flutter_weatherapp/screens/location/provider/location_provider.dart';
import 'package:flutter_weatherapp/screens/weather/provider/weather_provider.dart';
import 'package:provider/provider.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(providers: [
        ChangeNotifierProvider.value(value: WeatherProvider()),
        ChangeNotifierProvider.value(value: LocationProvider())
    ],
   child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
     
      builder: (BuildContext context, Widget? child) => MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const LocationScreen()
      ),
    );
  }
}


