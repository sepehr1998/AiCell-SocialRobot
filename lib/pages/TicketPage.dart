
import 'dart:convert';

import 'package:aicell/pages/MapPage.dart';
import 'package:aicell/pages/SMSPage.dart';
import 'package:aicell/pages/WeatherPage.dart';
import 'package:aicell/widgets/Header.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        margin: EdgeInsets.only(left: 40, right: 40, top: 10),
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
    },future:getTicketData() ,
      initialData: jsonEncode({
        'boarding_time':'00:00',
        'gate':'',
        'seat': '',
        'luggage': '',
        'date': '00/00/0000',
        'to': '',
        'from': '',
        'class': '',
        'flight_no':'',
        'company':'',
        'carrier':'',
        'name': ''
      }),);
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
          Header(),

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
                                margin: EdgeInsets.only(left: 100, top: 10),
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
                        margin: EdgeInsets.only(left: 100, top: 10),
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
                          margin: EdgeInsets.only(left: 100, top: 10),
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
                        showDialog(context: context, builder: (context) => SMS_Page(), barrierDismissible: false);                          },
                      child:
                      Container(
                        height: 400,
                        width: 400,
                        margin: EdgeInsets.only(left: 100, top: 10),
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
                                Image.asset("assets/sms.png")
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 50),
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
                            margin: EdgeInsets.only(left: 40, top: 20),
                            height: 100,
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