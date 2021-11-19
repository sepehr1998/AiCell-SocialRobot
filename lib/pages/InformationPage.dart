import 'package:aicell/widgets/Header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'FlightListPage.dart';
import 'ForbiddenItemsPage.dart';



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
         Header(),
          Container(
            height: 1478,
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(context: context, builder: (context) => FlightList_Page(), barrierDismissible: false);
                          },
                          child:
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
                        )

                      ],
                    ),

                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(context: context, builder: (context) => ForbiddenItems_Page(), barrierDismissible: false);
                          },
                          child:
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

