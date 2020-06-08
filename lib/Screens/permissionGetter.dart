import 'package:Weather/Screens/loader.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class PermissionGetter extends StatefulWidget {
  @override
  _PermissionGetterState createState() => _PermissionGetterState();
}

class _PermissionGetterState extends State<PermissionGetter> {

  @override
  void initState() {
    permissionStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
    );
  }

  permissionStatus() async{
    Location location = new Location();
    bool _serviceEnabled;

    _serviceEnabled = await location.serviceEnabled();

    if (_serviceEnabled == true){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Loader()), (Route<dynamic> route) => false);
      return;
    }

    await location.requestService();

    _serviceEnabled = await location.serviceEnabled();

    if (_serviceEnabled == true){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Loader()), (Route<dynamic> route) => false);
      return;
    }

    if(_serviceEnabled == false){
      permissionStatus();
    }
  }
}