import 'package:Weather/Screens/addCity.dart';
import 'package:flutter/material.dart';

class AddCityinHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          IconButton(padding: EdgeInsets.zero ,icon: Icon(Icons.search, size: 50.0), onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddCity()));
          }),
          SizedBox(height:10.0),
          Text('Search a City', textAlign: TextAlign.center ,style: TextStyle(fontSize: 16.0),)
        ],)
      ),
    );
  }
}