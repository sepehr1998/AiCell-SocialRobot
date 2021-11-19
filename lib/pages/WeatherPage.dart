
import 'dart:convert';

import 'package:aicell/connections/HttpConnector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Weather_Page extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather_Page> {

  var json;

  FutureBuilder getWeatherContent(String city){

    return FutureBuilder(builder: ( context , snapshot ) {
      json = jsonDecode(snapshot.data);
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child:
                  Text(json['name'].toString() +", ", style: TextStyle(
                    fontSize: 46,
                  ),)
              ),
              Container(
                  child:
                  Text(json['sys']['country'].toString(), style: TextStyle(
                    fontSize: 46,
                  ),)
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 50),
                  child:
                  Image.network("http://openweathermap.org/img/w/"+ json['weather'][0]['icon'].toString() + ".png", height: 150,fit:BoxFit.fill)
              ),
              Container(
                  margin: EdgeInsets.only(left: 20, top: 50),
                  child:
                  Text(json['weather'][0]['main'].toString()+", ", style: TextStyle(
                    fontSize: 46,
                  ),)
              ),
              Container(
                  margin: EdgeInsets.only(top: 50),
                  child:
                  Text(json['main']['temp'].toString(), style: TextStyle(
                    fontSize: 46,
                  ),)
              ),
              Container(
                  margin: EdgeInsets.only(top: 50),
                  child:
                  Text("°C", style: TextStyle(
                    fontSize: 46,
                  ),)
              ),
            ],
          ),
          Container(
            width: 700,
            height: 100,
            child: ElevatedButton(
              child: Text("Back", style: TextStyle(
                  fontSize: 30
              ),),
              onPressed: () {
                Navigator.pop(context);
              }
              ,
            ),
          ),
        ],
      );
    },future: getWeather(city), initialData: jsonEncode({
      'name':'',
      'weather':[{
        'main':'',
        'icon':''
      }],
      'sys':{
        'country':'',
      },
      'main':{
        'temp':''
      }

    }),);
  }
  @override
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: getWeatherContent('Tehran'),
    );
  }
}
