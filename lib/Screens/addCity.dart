import 'package:Weather/Provider/cityFinder.dart';
import 'package:Weather/Provider/searchApiData.dart';
import 'package:Weather/Screens/searchPageData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCity extends StatelessWidget with ChangeNotifier{
  TextEditingController countryName = TextEditingController();
  @override
  Widget build(BuildContext context){
    final cityData = Provider.of<CityFinder>(context);
    final showData = Provider.of<SearchWeatherData>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(children: <Widget>[
            SizedBox(height: 10.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal:10.0),
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                onFieldSubmitted: (data){
                  cityData.cityResult(data);
                },
                controller: countryName,
                decoration: InputDecoration(
                  hintText: 'Search your city ...',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0))
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              height: MediaQuery.of(context).size.height - 95.0,
              child: cityData.isLoading == true ? Center(child: CircularProgressIndicator(),)
                :
               ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: cityData.cityList.length,
                  itemBuilder: (context, int index){
                    return Container(
                      child: GestureDetector(
                        onTap: () {

                          showData.todayResponse(cityData.cityList[index]['lat'].toString(), cityData.cityList[index]['lon'].toString());
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchCityUI()));
                          },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(vertical:10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.blue
                            ),
                              child: Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                child: Text(cityData.cityList[index]['name'], style: TextStyle(fontSize:16.0),),
                              ),
                        ),
                      ),
                    );
                  },
                ),
            )
          ],),
        )),
      
    );
  }
}