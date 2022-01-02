import 'dart:developer';

import 'package:aicell/components/ActivityTimer.dart';
import 'package:aicell/widgets/Header.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../connections/CoreConnector.dart';
import 'InformationPage.dart';
import 'PlacesPage.dart';
import 'ServicesPage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Functions_Page extends StatefulWidget {
  @override
  _FunctionsState createState() => _FunctionsState();
}

class _FunctionsState extends State<Functions_Page> {
  @override
  Widget build(BuildContext context) {
    ActivityTimer.context = context;
    ActivityTimer.instance.resetTimer();
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
                                  Text(AppLocalizations.of(context).whatCanIDo,
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
                            ActivityTimer.instance.resetTimer();
                            CoreConnector.instance.changeUIStateToCore("sevice_page");
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Directionality(textDirection: TextDirection.ltr, child:Services_Page())),
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
                                      AppLocalizations.of(context).servicesButton,
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
                            ActivityTimer.instance.resetTimer();
                            CoreConnector.instance.changeUIStateToCore("places_page");
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  Directionality(textDirection: TextDirection.ltr, child:Places_Page())),
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
                                      AppLocalizations.of(context).placesButton,
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
                            ActivityTimer.instance.resetTimer();
                            CoreConnector.instance.changeUIStateToCore("ticket");
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
                                      AppLocalizations.of(context).ticketScanButton,
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
                            ActivityTimer.instance.resetTimer();
                            CoreConnector.instance.changeUIStateToCore("information_page");
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  Directionality(textDirection: TextDirection.ltr, child:Information_Page())),
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
                                      AppLocalizations.of(context).informationButton,
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

