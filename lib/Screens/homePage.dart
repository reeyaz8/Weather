import 'package:Weather/Screens/HomePage.dart';
import 'package:Weather/Screens/addCityinHomePage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: PageView(
       children:<Widget>[
        Home(),
        AddCityinHomePage()
       ]
     ),
    );
  }
}