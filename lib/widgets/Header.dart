

import 'package:aicell/connections/CoreConnector.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aicell/pages/RatingPage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Header extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff0358cd),
              Color(0xff4286fb),
            ],
          ),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(150),
            bottomLeft: Radius.circular(150),
          ),
          border: Border.all(
            width: 1,
            color: Colors.transparent,
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(

              ),
              margin: EdgeInsets.only(top: 40, left: 40),
              child:
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 20),
                    child: Text(AppLocalizations.of(context).welcome,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 35,
                          color: Colors.white
                      ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 200,
                    height: 100,
                    child: ElevatedButton(
                      child: Text(AppLocalizations.of(context).endSessionBtn, style: TextStyle(
                          fontSize: 30
                      ),),
                      onPressed: () {
                        CoreConnector.instance.changeUIStateToCore("goodbye");
                        showDialog(context: context, builder: (context) => Rating_Page(), barrierDismissible: false);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                    ),
                  )
                  )
                ],
              )
          ),
          Container(
            margin: EdgeInsets.only(left: 200, top: 20, bottom: 20),
            height: 400,
            child:
            AnalogClock(
              decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.black),
                  color: Colors.black,
                  shape: BoxShape.circle),
              width: 400,
              isLive: true,
              hourHandColor: Colors.white,
              minuteHandColor: Colors.white,
              showSecondHand: true,
              secondHandColor: Colors.red,
              numberColor: Color(0xfffcb813),
              showNumbers: true,
              textScaleFactor: 1.4,
              showTicks: true,
              tickColor: Color(0xfffcb813),
              showDigitalClock: false,
              datetime: DateTime(2019, 1, 1, 9, 12, 15),
            ),
          )
        ],
      ),
    );
  }
}