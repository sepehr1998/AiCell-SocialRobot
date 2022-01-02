

import 'dart:async';
import 'dart:convert';
import 'dart:developer';


import 'package:aicell/components/ActivityTimer.dart';
import 'package:aicell/connections/HttpConnector.dart';
import 'package:aicell/pages/MapPage.dart';
import 'package:aicell/widgets/BluePlaceButton.dart';
import 'package:aicell/widgets/WhitePlaceButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Places_Page extends StatefulWidget {
  @override
  _PlacesState createState() => _PlacesState();
}

class _PlacesState extends State<Places_Page> {

  var places= [];


  // Future<dynamic> loadData() async{
  //   var tmp = await getPlaces();
  //   setState(() {
  //     places = jsonDecode(tmp.body)["places"];
  //   });
  //   return places;
  // }


  @override
  void initState() {
    super.initState();
    getPlaces().then((value) {
      setState(() {
        places = jsonDecode(value.body)["places"];
      });
    });
  }

  void updateAndGetMap(String type){
    log("filtering places");
    var baggagePlace = places.firstWhere((json){
      return json['type'] == type;
    },orElse: null);
    log("places got filtered");
    log("calling API for change location");
    changePlaceMap(0,0, double.parse(baggagePlace['locX']),double.parse(baggagePlace['locY']))
        .then((value) {
      showDialog(context: context, builder: (context) => GetMap_Page(curntX: 0,curnty: 0,destX: 20,destY: 30,), barrierDismissible: false);
    })
        .onError((error, stackTrace) { log("error happend in calling API");});
    log("api called and showing dialog");
  }

  @override
  Widget build(BuildContext context) {
    ActivityTimer.context = context;
    ActivityTimer.instance.resetTimer();
    // loadData();
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
              // Image.asset("assets/features.png")
              Image.network("/initmap.png")
          ),
          Container(
            height: 1320,
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        updateAndGetMap("baggage");
                      },
                      child: BluePlaceButton(label: AppLocalizations.of(context).baggageReclaim,
                        margin: EdgeInsets.only(left: 40, top: 50),
                      )
                    ),
                    GestureDetector(
                      onTap: () {
                        updateAndGetMap("exchange");
                      },
                      child: WhitePlaceButton(label: AppLocalizations.of(context).exchange,
                        margin: EdgeInsets.only(left: 80, top: 50),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        updateAndGetMap("toll");
                      },
                      child:WhitePlaceButton(label: AppLocalizations.of(context).toll,
                      margin: EdgeInsets.only(left: 40, top: 50),
                     ),
                    ),

                    GestureDetector(
                      onTap: () {
                        updateAndGetMap("wc");
                      },
                      child:BluePlaceButton(label: AppLocalizations.of(context).wc,
                      margin: EdgeInsets.only(left: 80, top: 50),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        updateAndGetMap("cafe");
                      },
                      child:BluePlaceButton(label: AppLocalizations.of(context).cr,
                      margin: EdgeInsets.only(left: 40, top: 50),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        updateAndGetMap("shop");
                      },
                      child:WhitePlaceButton(label: AppLocalizations.of(context).shopping,
                      margin: EdgeInsets.only(left: 80, top: 50),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        updateAndGetMap("check_in");
                      },
                      child:WhitePlaceButton(label: AppLocalizations.of(context).checkin,
                      margin: EdgeInsets.only(left: 40, top: 50),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        updateAndGetMap("gate");
                      },
                      child:BluePlaceButton(label: AppLocalizations.of(context).gates,
                      margin: EdgeInsets.only(left: 80, top: 50),
                     ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        updateAndGetMap("passport_control");
                      },
                      child:BluePlaceButton(label: AppLocalizations.of(context).passport,
                      margin: EdgeInsets.only(left: 40, top: 50),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        updateAndGetMap("customs");
                      },
                      child:WhitePlaceButton(label: AppLocalizations.of(context).customs,
                      margin: EdgeInsets.only(left: 80, top: 50),
                      ),
                    ),

                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        updateAndGetMap("parking");
                      },
                      child:WhitePlaceButton(label: AppLocalizations.of(context).parking,
                      margin: EdgeInsets.only(left: 40, top: 50),
                      )  ,
                    ),
                    GestureDetector(
                      onTap: () {
                        updateAndGetMap("praying_room");
                      },
                      child:BluePlaceButton(label: AppLocalizations.of(context).prayingRoom,
                      margin: EdgeInsets.only(left: 80, top: 50),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        updateAndGetMap("stair");
                      },
                      child:BluePlaceButton(label: AppLocalizations.of(context).stairs,
                        margin: EdgeInsets.only(left: 40, top: 50),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        updateAndGetMap("elevator");
                      },
                      child:WhitePlaceButton(label: AppLocalizations.of(context).elevator,
                        margin: EdgeInsets.only(left: 80, top: 50),
                      ),
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
                            margin: EdgeInsets.only(left: 40, top: 100),
                            height: 150,
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
                                      AppLocalizations.of(context).backBtn,
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

