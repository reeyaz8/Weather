import 'package:Weather/Provider/apiData..dart';
import 'package:Weather/Provider/cityFinder.dart';
import 'package:Weather/Provider/searchApiData.dart';
import 'package:Weather/Screens/addCity.dart';
import 'package:Weather/Screens/permissionGetter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => WeatherData()),
          ChangeNotifierProvider(create: (_) => AddCity()),
          ChangeNotifierProvider(create: (_) => CityFinder()),
          ChangeNotifierProvider(create: (_) => SearchWeatherData()),
        ],
        child: MaterialApp(
        title: 'Weather',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: PermissionGetter()
      ),
    );
  }
}