import 'package:aicell/widgets/Header.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../connections/NatsConnector.dart';
import 'InformationPage.dart';
import 'PlacesPage.dart';
import 'ServicesPage.dart';


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
          Header(),
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
                            NatsConnector.instance.changeUIStateToCore("ticket");
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

