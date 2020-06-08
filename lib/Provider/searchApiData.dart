import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class SearchWeatherData with ChangeNotifier{

  Map<String, dynamic> _location = {};

  Map<String, dynamic> get location => _location;

  Map<String, dynamic> _current = {};

  Map<String, dynamic> get current => _current;

  List _forecast = [];

  List get forecast => _forecast;

  int _whichDay = 1;

  int get whichDay => _whichDay;

  Dio dio = new Dio();

  bool _dataRenderComplete = false;

  bool get dataRenderComplete => _dataRenderComplete; 

  todayResponse(String lat, String long) async {
    Response forecastResponse;

    ////Paste your api key here
    //// Get your api from https://www.weatherapi.com/
    String apiKey = "";

    String _urlForecast = "https://api.weatherapi.com/v1/forecast.json?key="+apiKey+"&q="+lat+" "+long+"&days=3";

    forecastResponse = await dio.get(_urlForecast);

    _location = forecastResponse.data['location'];

    _current = forecastResponse.data['current'];

    var _forecastData = forecastResponse.data['forecast']['forecastday'];

    _forecast = _forecastData;

    _dataRenderComplete = true;

    notifyListeners();

  }

  changeForecastDay(int day){
    _whichDay = day;
    notifyListeners();
  }
}