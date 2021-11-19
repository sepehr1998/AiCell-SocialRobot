import 'package:aicell/connections/HttpConnector.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persian_fonts/persian_fonts.dart';
import '../connections/NatsConnector.dart';
import '../States.dart';

class Languages_Page extends StatefulWidget {
  @override
  _LanguagesState createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages_Page> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/linear_background.png'),
          fit: BoxFit.cover,
        ),
      ),
      height: 1920,
      child: Column(
        children: [
          Container(
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
                        Text(
                          "Good Evening",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 45,
                              color: Colors.white
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30, bottom: 20),
                          child: Text("  Welcome to AICell",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 35,
                                color: Colors.white
                            ),),
                        ),
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
          ),

          Container(
            height: 1478,
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 40),
                    child:
                    Text("لطفا زبان مورد نظر خود را انتخاب کنید"
                      ,
                      style:
                      PersianFonts.Shabnam.copyWith(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                      ),
                    )
                ),
                Container(
                    margin: EdgeInsets.only(top: 40),
                    child:
                    Text("Please Select Your Preferred Language",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                      ),)
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  height: 500,
                  child: Image.asset("assets/sr2119.png"),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        States.instance.language = "English";
                        languageSelected("English").then((value) {
                          if(value.statusCode ==200)
                            NatsConnector.instance.changeUIStateToCore("alpha");
                        });
                      },
                      child:
                      Container(
                          margin: EdgeInsets.only(left: 100, top: 80),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(5, 5),
                              ),
                              BoxShadow(
                                color: Colors.white,
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                          ),
                          child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 80, left: 40),
                                  child: Text(
                                    "English",
                                    style:
                                    TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 40, left: 200, right: 40, bottom: 80),
                                  height: 100,
                                  child: Image.asset("assets/ukflag.png")
                              ),
                            ],
                          )
                      ),

                    ),
                    GestureDetector(
                      onTap: () {
                        States.instance.language = "Farsi";
                        languageSelected("Farsi").then((value) {
                          if(value.statusCode ==200)
                            NatsConnector.instance.changeUIStateToCore("alpha");
                        });
                      },
                      child: Container(
                          margin: EdgeInsets.only(left: 150, top: 80),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xff0358cd),
                                Color(0xff4286fb),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(5, 5),
                              ),
                              BoxShadow(
                                color: Colors.white,
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                          ),
                          child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 80, left: 200, right: 40),
                                  child: Text(
                                    "فارسی",
                                    style:
                                    PersianFonts.Shabnam.copyWith(
                                      decoration: TextDecoration.none,
                                      color: Colors.white,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 40, left: 40, right: 40, bottom: 80),
                                  height: 100,
                                  child: Image.asset("assets/iranflag.png")
                              ),
                            ],
                          )
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}