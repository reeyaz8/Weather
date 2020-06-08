import 'dart:async';
import 'package:Weather/Provider/apiData..dart';
import 'package:Weather/Screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

class Loader extends StatelessWidget {
  Geolocator geolocator = Geolocator();

  Position location;
  @override
  Widget build(BuildContext context) {

    final weatherdata = Provider.of<WeatherData>(context, listen: false);
    geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best
    ).then((value){
       weatherdata.todayResponse(value.latitude.toString(), value.longitude.toString());
    });

    Timer(Duration(seconds: 3), (){
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (Route<dynamic> route) => false);
    });

    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget>[
          CircularProgressIndicator(),
          SizedBox(height:5.0),
          Text('Getting your location...')
        ]
      ),),
    );
  }
}