import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:persian_fonts/persian_fonts.dart';

void main() {
  runApp(AiCell());
}
class AiCell extends StatefulWidget {
  @override
  _AiCellState createState() => _AiCellState();
}

class _AiCellState extends State<AiCell> {
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(

        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => Functions_Page(),
        '/third': (context) => Languages_Page(),
        },
        home: face());
  }
}
class face extends StatefulWidget {
  @override
  _faceState createState() => _faceState();
}

class _faceState extends State<face> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Languages_Page()),
        );
      },
      child:Container(
          color: Colors.transparent,
          height: 1920,
          child:
          Image.asset("assets/face.png")
      ) ,
    );
  }
}

class Functions_Page extends StatefulWidget {
  @override
  _FunctionsState createState() => _FunctionsState();
}

class _FunctionsState extends State<Functions_Page> {
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
                              Container(
                                width: 320,
                                margin: EdgeInsets.only(top: 30, bottom: 100, left: 20),
                                child: Text("You can choose your desired service from list bellow",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                    fontSize: 25,
                                      color: Colors.white,
                                  ),),
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
                ),

          Container(
            height: 1478,
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40, bottom: 40, left: 40),
                        child: Column(
                        children: [
                        DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(20),
                        color: Colors.blue,
                        strokeWidth: 5,
                        dashPattern: [6, 3, 2, 3],
                        child:
                        Container(
                        margin: EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 5),
                        child:
                        Text("My Services",
                        style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Color(0xff0358cd),
                         fontFamily: 'OtomanopeeOne',
                        ),
                        ),
                        ),
                        ),
                        ],
                        ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 40),
                          height: 500,
                          width: 450,
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
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 50),
                                  height: 200,
                                  child:
                                  Image.asset("assets/taxi.png")
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 100),
                                  child:
                                  Text(
                                    "Taxi Reservation",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 45,
                                      color: Colors.white,
                                    ),
                                  )
                              )
                            ],
                          ),
                        ),
                      ],
                    ),




                    Column(
                      children: [
                        Container(
                          height: 500,
                          width: 450,
                          margin: EdgeInsets.only(left: 80),
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
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 50),
                                  height: 200,
                                  child:
                                  Image.asset("assets/hotel.png")
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 100),
                                  child:
                                  Text(
                                    "Hotel Reservation",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 45,
                                      color: Colors.black,
                                    ),
                                  )
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 500,
                          width: 450,
                          margin: EdgeInsets.only(top: 80, left: 40),
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
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 50),
                                  height: 200,
                                  child:
                                  Image.asset("assets/ticket.png")
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 100),
                                  child:
                                  Text(
                                    "Ticket Scan",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 45,
                                      color: Colors.black,
                                    ),
                                  )
                              )
                            ],
                          ),
                        ),
                      ],
                    ),




                    Column(
                      children: [
                        Container(
                          height: 500,
                          width: 450,
                          margin: EdgeInsets.only(left: 80),
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
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 50),
                                  height: 200,
                                  child:
                                  Image.asset("assets/spoon.png")
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 100),
                                  child:
                                  Text(
                                    "Restaurants",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 45,
                                      color: Colors.white,
                                    ),
                                  )
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Functions_Page()),
                        );
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
                    Container(
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


