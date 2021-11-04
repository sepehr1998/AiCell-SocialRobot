import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:easy_web_view/easy_web_view.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:dart_nats/dart_nats.dart';

String state = "start";
// final Duration timerDurationGet = Duration(milliseconds: 600);
// final Duration timerDurationSend = Duration(milliseconds: 200);

var client = Client();

void main() {
  connect();
  runApp(AiCell());
}


void sendUIStateToCore(String state){
  client.pubString('UI2CORE', state);
}


void connect() async{
  await client.connect(Uri.parse('ws://localhost:80'));
  sendUIStateToCore(state);
}


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

class AiCell extends StatefulWidget {
  @override
  _AiCellState createState() => _AiCellState();
}

class _AiCellState extends State<AiCell> {


  @override
  Widget build(BuildContext context
      ) {
    return
      MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            // When navigating to the "/second" route, build the SecondScreen widget.
            '/second': (context) => Functions_Page(),
            '/third': (context) => Languages_Page(),
            '/forth': (context) => Services_Page(),
            '/fifth': (context) => Information_Page(),
            '/sixth': (context) => Places_Page(),
          },
          home: face());
  }
}
class face extends StatefulWidget {
  @override
  _faceState createState() => _faceState();
}

class _faceState extends State<face> {

  Future<http.Response> touched() async {
    var url = Uri.parse('http://localhost:5002/touch');
    var response = await http.post(url,
        body: jsonEncode({'touched': 'True'}),
        headers: {"content-type": "application/json"});
    return response;
  }



  // void syncState(timer) async{
  //   await setUIState(newState);
  //   var value = await getState();
  //   if(value.statusCode ==200){
  //     newState = jsonDecode(value.body)['ui_state'];
  //     if(newState != state){
  //       state = newState;
  //       print("ui state changed to: "+ state);
  //       switch (state) {
  //         case "choose_language":
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => Languages_Page()),
  //           );
  //           break;
  //         case "start":
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => face()),
  //           );
  //           break;
  //         case "introduction":
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => face()),
  //           );
  //           break;
  //         case "wait_move":
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => face()),
  //           );
  //           break;
  //         case "move_to_destination":
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => face()),
  //           );
  //           break;
  //         case "goodbye":
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => face()),
  //           );
  //           break;
  //         case "wait_ticket":
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => Ticket_Page()),
  //           );
  //           break;
  //         case "ticket":
  //           showDialog(context: context, builder: (context) => Camera_Page(), barrierDismissible: false);
  //           break;
  //         case "alpha":
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => Functions_Page()),
  //           );
  //           break;
  //         case "mask_error":
  //           showDialog(context: context, builder: (context) => Camera_Page(),  barrierDismissible: false);
  //           break;
  //       }
  //     }
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    // Timer getTimer = new Timer.periodic(timerDurationGet, syncState);
    var sub = client.sub("CORE2UI");
    sub.stream.listen((event) {
      state = event.string;
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
        case "introduction":
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => face()),
          );
          break;
        case "wait_move":
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => face()),
          );
          break;
        case "move_to_destination":
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => face()),
          );
          break;
        case "goodbye":
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
          showDialog(context: context, builder: (context) => Camera_Page(), barrierDismissible: false);
          break;
        case "alpha":
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Functions_Page()),
          );
          break;
        case "mask_error":
          showDialog(context: context, builder: (context) => Camera_Page(),  barrierDismissible: false);
          break;
      }
    });
    return GestureDetector(
      onTap: () {
        touched().then((value) {
            if (value.statusCode == 200) {
              state = "choose_language";
              sendUIStateToCore(state);
            }
          }
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
                        Text("What Can I Do?",
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
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Services_Page()),
                              );
                            },
                            child:
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
                          )
                      ],
                    ),




                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Places_Page()),
                            );
                          },
                          child:
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
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            state = "ticket";
                            sendUIStateToCore(state);
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Information_Page()),
                            );
                          },
                          child:
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
                                    Image.asset("assets/info.png")
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
                        )
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







class Services_Page extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services_Page> {
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
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 40, top: 60),
                          height: 500,
                          width: 450,
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
                                  height: 300,
                                  child:
                                  Image.asset("assets/taxi.png")
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 50),
                                  child:
                                  Text(
                                    "Taxi",
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
                          margin: EdgeInsets.only(left: 80, top: 60),
                          decoration:
                          BoxDecoration(
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
                                  height: 400,
                                  child:
                                  Image.asset("assets/hotel.png")
                              ),
                              Container(
                                  child:
                                  Text(
                                    "Hotel",
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
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
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
                                    height: 400,
                                    child:
                                    Image.asset("assets/toll.png")
                                ),
                                Container(
                                    child:
                                    Text(
                                      "Toll",
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
                        )
                      ],
                    ),




                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(context: context, builder: (context) => SMS_Page(), barrierDismissible: false);                          },
                          child:
                          Container(
                            height: 500,
                            width: 450,
                            margin: EdgeInsets.only(left: 80, top: 80),
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
                                    margin: EdgeInsets.only(top: 80),
                                    height: 200,
                                    child:
                                    Image.asset("assets/sms.png")
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 100),
                                    child:
                                    Text(
                                      "SMS Alarm",
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
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 120,
                      width: 1020,
                      margin: EdgeInsets.only(left: 30, top: 80),
                      child:
                      ElevatedButton(
                        child: Text("Back", style: TextStyle(
                            fontSize: 40
                        ),),
                        onPressed: () {
                          Navigator.pop(context);
                        }
                        ,
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





class Information_Page extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information_Page> {
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
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 40, top: 150),
                          height: 500,
                          width: 450,
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
                                  height: 300,
                                  child:
                                  Image.asset("assets/flightslist.png")
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 50),
                                  child:
                                  Text(
                                    "Flights List",
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
                          margin: EdgeInsets.only(left: 80, top: 150),
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
                                  height: 400,
                                  child:
                                  Image.asset("assets/forbiddenitems.png")
                              ),
                              Container(
                                  child:
                                  Text(
                                    "Forbidden Items",
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
                ),

                Row(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                        onTap: () {
                            Navigator.pop(context);
                            },
                    child:
                          Container(
                        margin: EdgeInsets.only(left: 40, top: 150),
                            height: 200,
                            width: 980,
                            decoration: BoxDecoration(
                            gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                            Color(0xff0358cd),
                            Color(0xffffffff),
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
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             Container(
                            height: 100,
                            child:
                              Image.asset("assets/back.png")
                            ),
                              Container(
                              child:
                                   Text(
                                    "Back",
                                    style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 45,
                                    color: Colors.black,
                                    ),
                                    )
                            ),
                            ],
                          ),
                        ),
                            ),
                      ],
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






class Places_Page extends StatefulWidget {
  @override
  _PlacesState createState() => _PlacesState();
}

class _PlacesState extends State<Places_Page> {

  var places= [];

  Future<http.Response> getPlaces() async {
    var url = Uri.parse('http://localhost:5002/send_places');
    var response = await http.get(url,
        headers: {"content-type": "application/json"});
    return response;
  }

  Future<dynamic> loadData() async{
    var tmp = await getPlaces();
    places = jsonDecode(tmp.body)["places"];
    return places;
  }

  FutureBuilder getPlacesShape(){
    return FutureBuilder(builder: (context, snapshot) =>Text(snapshot.data.toString())
        , future: loadData()
        ,initialData: []);
  }


  @override
  Widget build(BuildContext context) {
    loadData();
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
            height: 600,
            child:
              Image.asset("assets/features.png")
          ),
          Container(
            height: 1320,
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 40, top: 50),
                          height: 100,
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
                                  margin: EdgeInsets.only(top: 20),
                                  child:
                                  Text(
                                    "Baggage Reclaim",
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
                          height: 100,
                          width: 450,
                          margin: EdgeInsets.only(left: 80, top: 50),
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
                                  margin: EdgeInsets.only(top: 20),
                                  child:
                                  Text(
                                    "Exchange",
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
                          margin: EdgeInsets.only(left: 40, top: 50),
                          height: 100,
                          width: 450,
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
                                  margin: EdgeInsets.only(top: 20),
                                  child:
                                  Text(
                                    "Toll",
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
                          height: 100,
                          width: 450,
                          margin: EdgeInsets.only(left: 80, top: 50),
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
                                  margin: EdgeInsets.only(top: 20),
                                  child:
                                  Text(
                                    "WC",
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
                ),

                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 40, top: 50),
                          height: 100,
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
                                  margin: EdgeInsets.only(top: 20),
                                  child:
                                  Text(
                                    "Cafe & Restaurant",
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
                          height: 100,
                          width: 450,
                          margin: EdgeInsets.only(left: 80, top: 50),
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
                                  margin: EdgeInsets.only(top: 20),
                                  child:
                                  Text(
                                    "Shopping",
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
                          margin: EdgeInsets.only(left: 40, top: 50),
                          height: 100,
                          width: 450,
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
                                  margin: EdgeInsets.only(top: 20),
                                  child:
                                  Text(
                                    "Check-in",
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
                          height: 100,
                          width: 450,
                          margin: EdgeInsets.only(left: 80, top: 50),
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
                                  margin: EdgeInsets.only(top: 20),
                                  child:
                                  Text(
                                    "Gates",
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
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 40, top: 50),
                          height: 100,
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
                                  margin: EdgeInsets.only(top: 20),
                                  child:
                                  Text(
                                    "Passport Control",
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
                          height: 100,
                          width: 450,
                          margin: EdgeInsets.only(left: 80, top: 50),
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
                                  margin: EdgeInsets.only(top: 20),
                                  child:
                                  Text(
                                    "Customs",
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
                            Navigator.pop(context);
                          },
                          child:
                          Container(
                            margin: EdgeInsets.only(left: 40, top: 150),
                            height: 200,
                            width: 980,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xff0358cd),
                                  Color(0xffffffff),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 100,
                                    child:
                                    Image.asset("assets/back.png")
                                ),
                                Container(
                                    child:
                                    Text(
                                      "Back",
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 45,
                                        color: Colors.black,
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
                            state = "alpha";
                            sendUIStateToCore(state);
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
                            state = "alpha";
                            sendUIStateToCore(state);
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
  var json;

  FutureBuilder getTicket(){
    return FutureBuilder(builder: (context , snapshot) {
      if(!snapshot.hasError)
        json = jsonDecode(snapshot.data);
      else
        json= {
          'boarding_time':'00:00',
          'gate':'11',
          'seat': '11 A',
          'luggage': 'Y',
          'date': '11/08/2021',
          'to': 'First Airport',
          'from': 'Second Airport',
          'class': 'A',
          'flight_no':'724',
          'company':'Test',
          'carrier':'EA',
          'name': 'Test Test'
        };
      return Container(
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
                    Text(json['company'],
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
                      child: Text(json['name'],
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
                      child: Text(json['carrier'],
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
                      child: Text(json['flight_no'],
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
                      child: Text(json['class'],
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
                      child: Text("From: "+json['from'],
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.black,
                            fontSize: 26,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20),
                      child: Text("To: "+json['from'],
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
                      child: Text(json['date'],
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
                      child: Text(json['luggage'],
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
                      child: Text(json['seat'],
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
                      child: Text(json['gate'],
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
                      child: Text(json['boarding_time'],
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
      );
    },future:getTicketData() ,);
  }

  Future<http.Response> getTicketData() async {
    var url = Uri.parse('http://localhost:5002/user_data');
    var response = await http.get(url,
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
                getTicket(),



                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                              showDialog(context: context, builder: (context) => GetMap_Page(), barrierDismissible: false);
                        },
                        child: (
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
                            )
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
                                  "Guide to gate",
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
                    GestureDetector(
                      onTap: () {
                        showDialog(context: context, builder: (context) => Weather_Page(), barrierDismissible: false);
                      },
                      child:
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
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
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
class GetMap_Page extends StatefulWidget {
  @override
  _GetMapState createState() => _GetMapState();
}

class _GetMapState extends State<GetMap_Page> {

  @override
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
       content: Column(
           mainAxisSize: MainAxisSize.min,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(
                 width: 800,
                 height: 600,
                 margin: EdgeInsets.only(bottom: 30),
                 child:
                 Image.asset("assets/features.png")
             ),
        DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(20),
          color: Colors.blue,
          strokeWidth: 10,
          dashPattern: [6, 3, 2, 3],
             child:
             Container(
               margin: EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
                 decoration: BoxDecoration(
                   color: Colors.white,
                 ),
                 child: Text("You can download this map by scanning QR code bellow",
                          style: TextStyle(
                           decoration: TextDecoration.none,
                           color: Colors.black,
                           fontSize: 40,
                           fontWeight: FontWeight.bold,
                         ),
                      )
                      ),
             ),
             Container(
               height: 300,
               width: 300,
               margin: EdgeInsets.only(top: 50, bottom: 50),
               child: Image.asset("assets/direction.png"),
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
         )
    );
  }
}


class Camera_Page extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera_Page> {

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 700,
        height: 700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 640,
              height: 480,
              child:
              EasyWebView(
                src: "http://localhost:5002/",
                key: Key("Camera"),
                isHtml: false,
                isMarkdown: false,
                convertToWidgets: false,
                onLoaded: (){
                  print('loaded');
                },
              ) ,
            ),
            Container(
              width: 640,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                width: 100,
                height: 80,
                child: ElevatedButton(
                  child: Text("بازگشت"),
                  onPressed: () {
                    state = "alpha";
                    sendUIStateToCore(state);
                  }
                  ,
                ),
              ),
            ),
          ],
        )
    );
  }
}



class SMS_Page extends StatefulWidget {
  @override
  _SMSState createState() => _SMSState();
}

class _SMSState extends State<SMS_Page> {

  @override
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 800,
                height: 600,
                margin: EdgeInsets.only(bottom: 30),
                child:
                Image.asset("assets/features.png")
            ),
            DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(20),
              color: Colors.blue,
              strokeWidth: 10,
              dashPattern: [6, 3, 2, 3],
              child:
              Container(
                  margin: EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Text("You can download this map by scanning QR code bellow",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  )
              ),
            ),
            Container(
              height: 300,
              width: 300,
              margin: EdgeInsets.only(top: 50, bottom: 50),
              child: Image.asset("assets/direction.png"),
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
        )
    );
  }
}


class Weather_Page extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather_Page> {

  var json;
  Future<http.Response> getWeather(String city) async {
    var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=' + city + '&appid=b8563a6551279ccbfe066c7f77dd3293&units=metric');
    var response = await http.get(url,
        headers: {"content-type": "application/json"});
    return response;
  }

  FutureBuilder getWeatherContent(String city){

    return FutureBuilder(builder: ( context , snapshot ) {
      json = jsonDecode(snapshot.data.body);
      log(json);
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
                  Image.network("http://openweathermap.org/img/w/"+ json['weather'][0]['icon'].toString() + ".png")
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
    },future: getWeather(city));
  }
  @override
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: getWeatherContent('Tehran'),
    );
  }
}