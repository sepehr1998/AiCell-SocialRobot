import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:easy_web_view/easy_web_view.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:http/http.dart' as http;

String state = "start";

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
        '/services': (context) => Functions_Page(),
        '/languages': (context) => Languages_Page(),
        '/pop-up': (context) => Camera_Page(),
        },
        home: face(),
      );
  }


}
class face extends StatefulWidget {
  @override
  _faceState createState() => _faceState();
}

class _faceState extends State<face> {


  final Duration timerDurationGet = Duration(milliseconds: 600);
  final Duration timerDurationSend = Duration(milliseconds: 200);

  Future<http.Response> getState() async {
    var url = Uri.parse('http://localhost:5002/send_ui_state');
    var response = await http.get(url,
        headers: {"content-type": "application/json"});
    return response;
  }

  Future<http.Response> setUIState(String state) async {
    var url = Uri.parse('http://localhost:5002/get_ui_state');
    var response = await http.post(url,
        body: jsonEncode({'state': state}),
        headers: {"content-type": "application/json"});
    return response;
  }

  Future<http.Response> touched() async {
    var url = Uri.parse('http://localhost:5002/touch');
    var response = await http.post(url,
        body: jsonEncode({'touched': 'True'}),
        headers: {"content-type": "application/json"});
    return response;
  }


  void changePage(timer) {
    getState().then((value) {
      if(value.statusCode ==200){
        String newState = jsonDecode(value.body)['ui_state'];
        if(newState != state){
          state = newState;
          print("ui state changed to: "+ state);
          switch (state) {
            case "choose_language":
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Languages_Page()),
              );
              break;
            case "start":
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => face()),
              );
              break;
            case "wait_ticket":
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ticket_Page()),
              );
              break;
            case "ticket":
              showDialog(context: context, builder: (context) => Camera_Page());
              break;
            case "alpha":
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Functions_Page()),
              );
              break;
            case "mask_error":
              showDialog(context: context, builder: (context) => Camera_Page());
              break;
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer getTimer = new Timer.periodic(timerDurationGet, changePage);
    Timer setTimer = new Timer.periodic(timerDurationSend, (timer) => setUIState(state));
    return GestureDetector(
      onTap: () {
        touched().then((value) {
            if (value.statusCode == 200) {
              state = "choose_language";
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Languages_Page()),
              );
            }
          }
        );
      },
      child:Container(
          color: Colors.transparent,
          height: 1920,
          child:
          Image.asset("assets/welcome-icegif.gif")
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
                                  height: 300,
                                  child:
                                  Image.asset("assets/services.png")
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 50),
                                  child:
                                  Text(
                                    "Services",
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
                                  height: 400,
                                  child:
                                  Image.asset("assets/places.png")
                              ),
                              Container(
                                  child:
                                  Text(
                                    "Places",
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
                        GestureDetector(
                          onTap: () {
                            state = "ticket";
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Ticket_Page()),
                            );
                          },
                          child:
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
                        )
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
                                    "Information",
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

  Future<http.Response> languageSelected(String language) async {
    var url = Uri.parse('http://localhost:5002/language');
    var response = await http.post(url,
        body: jsonEncode({'touched': 'True', 'language': language}),
        headers: {"content-type": "application/json"});
    return response;
  }

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
                        languageSelected("English").then((value) {
                          if(value.statusCode ==200)
                              Navigator.push(
                              context,
                                MaterialPageRoute(builder: (context) => Functions_Page()),
                              );
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
                        languageSelected("Farsi").then((value) {
                          if(value.statusCode ==200)
                            Navigator.push(
                              context,
                              // TODO edit this so it redirect to farsi page
                              MaterialPageRoute(builder: (context) => Functions_Page()),
                            );
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


class Ticket_Page extends StatefulWidget {
  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket_Page> {
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
                  height: 500,
                  margin: EdgeInsets.only(left: 40, right: 40, top: 40),
                  decoration: BoxDecoration(
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
                    borderRadius: BorderRadius.circular(80),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xff0358cd),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(80),
                            topLeft: Radius.circular(80),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 150),
                              height: 60,
                              child:
                                Image.asset("assets/airplaneticket.png")
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 80),
                              child:
                              Text("Emirates Airlines",
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontSize: 24,
                              ),),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 100),
                              child:
                              Text("Boarding Pass",
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                  fontSize: 24,
                                ),),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20, left: 20),
                                child: Text("Name of passenger:",
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.black,
                                  fontSize: 26,
                                )),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, left: 20),
                                child: Text("SAMADI SEPEHR",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 26,
                                    )),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20, left: 80),
                                child: Text("Carrier:",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 26,
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, left: 80),
                                child: Text("EM",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 26,
                                    )),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20, left: 80),
                                child: Text("Flight No:",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 26,
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, left: 80),
                                child: Text("EM 1108",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 26,
                                    )),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20, left: 80),
                                child: Text("Class:",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 26,
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, left: 80),
                                child: Text("A",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 26,
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 50, left: 20),
                                child: Text("From: Tehran IKIA",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 26,
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, left: 20),
                                child: Text("To: Somewhere SW",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 26,
                                    )),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 50, left: 80),
                                child: Text("Date:",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 26,
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, left: 80),
                                child: Text("18/7/2021",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 26,
                                    )),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 50, left: 80),
                                child: Text("Luggage:",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 26,
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, left: 80),
                                child: Text("Y",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 26,
                                    )),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 50, left: 80),
                                child: Text("Seat:",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 26,
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, left: 80),
                                child: Text("5A",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 26,
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 50, left: 50),
                                child: Text("Gate",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Color(0xff0358cd),
                                      fontSize: 40,
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, left: 50),
                                child: Text("11",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Color(0xff0358cd),
                                      fontSize: 40,
                                    )),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 50, left: 200),
                                child: Text("Boarding Time",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Color(0xff0358cd),
                                      fontSize: 40,
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, left: 200),
                                child: Text("15:30",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Color(0xff0358cd),
                                      fontSize: 40,
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),




                Row(
                  children: [
                    Container(
                      height: 400,
                      width: 400,
                        margin: EdgeInsets.only(left: 100, top: 60),
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 20, left: 80, right: 80),
                                height: 200,
                                child: Image.asset("assets/maps.png")
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 60),
                                child: Text(
                                  "Get Map",
                                  style:
                                  TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.black,
                                  ),
                                )
                            ),

                          ],
                        )
                    ),
                    Container(
                        height: 400,
                        width: 400,
                        margin: EdgeInsets.only(left: 100, top: 60),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 40, left: 80, right: 80),
                                height: 200,
                                child: Image.asset("assets/direction.png")
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 40),
                                child: Text(
                                  "Direction",
                                  style:
                                  TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                  ),
                                )
                            ),

                          ],
                        )
                    ),
                  ],
                ),


                Row(
                  children: [
                    Container(
                        height: 400,
                        width: 400,
                        margin: EdgeInsets.only(left: 100, top: 40),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 20, left: 80, right: 80),
                                height: 200,
                                child: Image.asset("assets/weather.png")
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 60),
                                child: Text(
                                  "Destination Weather",
                                  style:
                                  TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                    fontSize: 34,
                                  ),
                                )
                            ),

                          ],
                        )
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Functions_Page()),
                        );
                      },
                      child:
                    Container(
                        height: 400,
                        width: 400,
                        margin: EdgeInsets.only(left: 100, top: 40),
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 40, left: 80, right: 80),
                                height: 200,
                                child: Image.asset("assets/back.png")
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 40),
                                child: Text(
                                  "Back",
                                  style:
                                  TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.black,
                                  ),
                                )
                            ),

                          ],
                        )
                    ),
                    ),
                  ],

                ),



              ],
            ),
          )
        ],
      ),

    );
  }
}


class Camera_Page extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera_Page> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: EasyWebView(
        src: "https://flutter.dev/",
        key: Key("Test"),
        isHtml: false, // Use Html syntax
        isMarkdown: false, // Use markdown syntax
        convertToWidgets: false,
        onLoaded: () {
          print('Loaded');
        },
      ),
    );
  }
}
