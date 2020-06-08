import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class CityFinder with ChangeNotifier{

  List _cityList = [];

  List get cityList => _cityList;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Dio dio = new Dio();


  cityResult(String keyword)async{
    _isLoading = true;

    Response response;

    ////Paste your api key here
    //// Get your api from https://www.weatherapi.com/
    String apiKey = "" ;

    String _url = "http://api.weatherapi.com/v1/search.json?key="+apiKey+"&q="+keyword;

    response = await dio.get(_url);

    _cityList = response.data;

    _isLoading = false;

    notifyListeners();
  }
}