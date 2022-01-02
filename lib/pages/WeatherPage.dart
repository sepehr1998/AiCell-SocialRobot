
import 'dart:convert';

import 'package:aicell/components/ActivityTimer.dart';
import 'package:aicell/connections/HttpConnector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Weather_Page extends StatelessWidget {

  const Weather_Page({Key key, this.cityName}) : super(key: key);

  final String cityName;

  FutureBuilder getWeatherContent(String city,String language){

    return FutureBuilder(builder: ( context , snapshot ) {
      var json = jsonDecode(snapshot.data);
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
                  Text(json['weather'][0]['description'].toString()+", ", style: TextStyle(
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
              child: Text(AppLocalizations.of(context).backBtn, style: TextStyle(
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
    },future: getWeather(city,language), initialData: jsonEncode({
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
  Widget build(BuildContext context) {
    ActivityTimer.context = context;
    ActivityTimer.instance.resetTimer();
    return AlertDialog(
      content: getWeatherContent(cityName,AiCell.of(context).locale.languageCode),
    );
  }
}
