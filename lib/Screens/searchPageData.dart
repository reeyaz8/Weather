import 'package:Weather/Provider/searchApiData.dart';
import 'package:Weather/Screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchCityUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherdata = Provider.of<SearchWeatherData>(context);
    if (weatherdata.location == null) {
      return Scaffold(body: CircularProgressIndicator(),);
    } else {
      return Scaffold(
      appBar: weatherdata.dataRenderComplete == false ? null : PreferredSize(child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.close, color: Colors.blue,), onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          })
        ],
        title: Column(children: <Widget>[
        SizedBox(height:10.0),
        Text(weatherdata.location['name'].toString(), style: TextStyle(color: Colors.black, fontSize: 30.0)),
        SizedBox(height:5.0)
        ],
        ),
      ), 
        preferredSize: Size.fromHeight(70.0),),

      body: weatherdata.dataRenderComplete == false ? Center(child: CircularProgressIndicator()) : Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 70.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.blue, Colors.blue, Colors.blue])),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(children:<Widget>[
                SizedBox(height: 30.0),
                Container(
                  height: 100.0,
                  child: Text(weatherdata.current['temp_c'].toString()+' °C', style: TextStyle(fontSize:75.0),),),
                SizedBox(height: 20.0),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.blue
                    ),
                    width: MediaQuery.of(context).size.width/2 - 35.0,

                    height: 125.0,
                    alignment: Alignment.topCenter,
                    child: Column(children:<Widget>[
                        SizedBox(height:15.0),
                        Container(
                          height: 75.0,
                          width: 75.0,
                          child: Image.network('http:'+weatherdata.current['condition']['icon'])),
                        FittedBox(child: Text(weatherdata.current['condition']['text'], style: TextStyle(color: Colors.black, fontSize: 20.0),))
                    ]),
                  ),
                  Container(
                    child: VerticalDivider(width: 30.0,)
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2 - 35.0,
                    height: 125.0,
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.blue
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Column(children: <Widget>[
                          Text(weatherdata.forecast[0]['day']['maxtemp_c'].toString(), style: TextStyle(color: Colors.black, fontSize: 35.0),),
                          Container(
                            width: 50.0,
                            child: Divider(height: 20.0 , thickness: 2.0,color: Colors.black,)),
                          Text(weatherdata.forecast[0]['day']['mintemp_c'].toString(), style: TextStyle(color: Colors.black, fontSize: 35.0),),
                        ],),
                        SizedBox(width: 20.0),
                        Container(child: Text('°C', style: TextStyle(fontSize: 30.0, color: Colors.black),),)
                      ],)
                    ],)
                  ),
                ],),),
                  SizedBox(height:20.0),
                Container(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      Container(
                        alignment: Alignment.topCenter,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        height: 70.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.blue
                        ),
                        child: Container(
                           margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(vertical:5.0),
                              child: Image.asset('images/sunset.png')),
                            SizedBox(width: 40.0,),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget>[
                              Text('Sunrise', style: TextStyle(fontSize:18.0),),
                              SizedBox(height:10.0),
                              FittedBox(child: Text(weatherdata.forecast[0]['astro']['sunrise'], style: TextStyle(fontSize:25.0),))
                            ],)
                          ],),
                        )),
                      SizedBox(height:10.0),
                      Container(
                        alignment: Alignment.topCenter,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        height: 70.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.blue
                        ),
                        child: Container(
                           margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(vertical:5.0),
                              child: Image.asset('images/sunset.png')),
                            SizedBox(width: 40.0,),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget>[
                              Text('Sunset', style: TextStyle(fontSize:18.0),),
                              SizedBox(height:10.0),
                              FittedBox(child: Text(weatherdata.forecast[0]['astro']['sunset'], style: TextStyle(fontSize:25.0),))
                            ],)
                          ],),
                        ),
                         ),
                ],)),
                SizedBox(height: 20.0),
              Container(margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.blue
                      ),
                      width: MediaQuery.of(context).size.width/3 - 25,
                      height: 70.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Chance of Rain'),
                          SizedBox(height:10.0),
                          FittedBox(child: Text(weatherdata.forecast[0]['day']['daily_chance_of_rain'].toString()+' %', style: TextStyle(fontSize: 25.0),))
                        ],
                      ),),
                    SizedBox(width:15.0),
                    Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.blue
                      ),
                      width: MediaQuery.of(context).size.width/3 - 25,
                      height: 70.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Humidity'),
                          SizedBox(height:10.0),
                          FittedBox(child: Text(weatherdata.current['humidity'].toString()+' %', style: TextStyle(fontSize: 25.0),))
                        ],
                      ),),
                    SizedBox(width:15.0),
                    Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.blue
                      ),
                      width: MediaQuery.of(context).size.width/3 - 25,
                      height: 70.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Precipitation'),
                          SizedBox(height:10.0),
                          FittedBox(child: Text(weatherdata.current['precip_mm'].toString()+' mm', style: TextStyle(fontSize: 25.0),))
                        ],
                      ),
                      ),
                  ],),
              ),
              SizedBox(height:20.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.blue
                ),
                child: Column(
                  children: <Widget>[
                    Text('Wind', style: TextStyle(fontSize:20.0, fontWeight: FontWeight.w400),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.blue
                      ),
                      width: MediaQuery.of(context).size.width/3 - 25,
                      height: 70.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Speed'),
                          SizedBox(height:10.0),
                          FittedBox(child: Text(weatherdata.current['wind_kph'].toString()+' KpH', style: TextStyle(fontSize: 25.0),))
                        ],
                      ),),
                        Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.blue
                      ),
                      width: MediaQuery.of(context).size.width/3 - 25,
                      height: 70.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Direction'),
                          SizedBox(height:10.0),
                          FittedBox(child: Text(weatherdata.current['wind_dir'].toString(), style: TextStyle(fontSize: 25.0),))
                        ],
                      ),),
                        Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.blue
                      ),
                      width: MediaQuery.of(context).size.width/3 - 25,
                      height: 70.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Degree'),
                          SizedBox(height:10.0),
                          FittedBox(child: Text(weatherdata.current['wind_degree'].toString()+'°', style: TextStyle(fontSize: 25.0),))
                        ],
                      ),),
                    ],)
                  ],
                ),
              ),
              SizedBox(height:30.0),
              Container(
                child: Text("Forecasts", style: TextStyle(fontSize: 25.0)),
              ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  OutlineButton(onPressed: (){
                    weatherdata.changeForecastDay(1);
                  }, 
                  borderSide: BorderSide(
                    color: weatherdata.whichDay == 1 ? Colors.purple:Colors.grey,
                    width:2.0
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(DateTime.now().add(new Duration(days: 1)).toString().split(' ')[0])),
                  OutlineButton(onPressed: (){
                    weatherdata.changeForecastDay(2);
                  },
                    borderSide: BorderSide(
                    color: weatherdata.whichDay == 2 ? Colors.purple:Colors.grey,
                    width:2.0
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                   child: Text(DateTime.now().add(new Duration(days: 2)).toString().split(' ')[0])),
              ],)
            ),
            SizedBox(height:20.0),
            Container(child: Column(
              children:<Widget>[
                  Container(
                  height: 100.0,
                  child: Text(weatherdata.forecast[weatherdata.whichDay]['day']['avgtemp_c'].toString()+' °C', style: TextStyle(fontSize:75.0),),),
                  Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.blue
                    ),
                    width: MediaQuery.of(context).size.width/2 - 35.0,

                    height: 130.0,
                    alignment: Alignment.topCenter,
                    child: Column(children:<Widget>[
                        SizedBox(height:15.0),
                        Container(
                          height: 75.0,
                          width: 75.0,
                          child: Image.network('http:'+weatherdata.forecast[weatherdata.whichDay]['day']['condition']['icon'])),
                        FittedBox(child: Text(weatherdata.forecast[weatherdata.whichDay]['day']['condition']['text'], style: TextStyle(color: Colors.black, fontSize: 18.0),))
                    ]),
                  ),
                  Container(
                    child: VerticalDivider(width: 30.0,)
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2 - 35.0,
                    height: 125.0,
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.blue
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Column(children: <Widget>[
                          Text(weatherdata.forecast[weatherdata.whichDay]['day']['maxtemp_c'].toString(), style: TextStyle(color: Colors.black, fontSize: 35.0),),
                          Container(
                            width: 50.0,
                            child: Divider(height: 20.0 , thickness: 2.0,color: Colors.black,)),
                          Text(weatherdata.forecast[weatherdata.whichDay]['day']['mintemp_c'].toString(), style: TextStyle(color: Colors.black, fontSize: 35.0),),
                        ],),
                        SizedBox(width: 20.0),
                        Container(child: Text('°C', style: TextStyle(fontSize: 30.0, color: Colors.black),),)
                      ],)
                    ],)
                  ),
                ],),),
            ]),),
            SizedBox(height:40.0),
            Container(
              height: 150.0,
              child: 
            GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.5,
              crossAxisCount: 3),
              physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Container(child: Column(children: <Widget>[
                Container(child: Text('Chance of rain')),
                FittedBox(child: Text(weatherdata.forecast[weatherdata.whichDay]['day']['daily_chance_of_rain'].toString()+' %', style: TextStyle(fontSize: 22.0),))
              ],),),
                Container(child: Column(children: <Widget>[
                Container(child: Text('Humidity')),
                FittedBox(child: Text(weatherdata.forecast[weatherdata.whichDay]['day']['avghumidity'].toString()+' %', style: TextStyle(fontSize: 22.0),))
              ],),),
                Container(child: Column(children: <Widget>[
                Container(child: Text('Precipitation')),
                FittedBox(child: Text(weatherdata.forecast[weatherdata.whichDay]['day']["totalprecip_mm"].toString()+' mm', style: TextStyle(fontSize: 22.0),))
              ],),),
                Container(child: Column(children: <Widget>[
                Container(child: Text('Wind')),
                FittedBox(child: Text(weatherdata.forecast[weatherdata.whichDay]['day']["maxwind_kph"].toString()+' KpH', style: TextStyle(fontSize: 22.0),))
              ],),),
               Container(child: Column(children: <Widget>[
                Container(child: Text('Sunrise')),
                FittedBox(child: Text(weatherdata.forecast[weatherdata.whichDay]['astro']["sunrise"].toString(), style: TextStyle(fontSize: 22.0),))
              ],),),
                Container(child: Column(children: <Widget>[
                Container(child: Text('Sunset')),
                FittedBox(child: Text(weatherdata.forecast[weatherdata.whichDay]['astro']["sunset"].toString(), style: TextStyle(fontSize: 22.0),))
              ],),),
            ],
            ))
              ]),
        ),
      ),

    );
    }
  }
}