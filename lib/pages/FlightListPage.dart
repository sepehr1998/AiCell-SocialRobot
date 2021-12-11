import 'package:aicell/components/ActivityTimer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class FlightList_Page extends StatefulWidget {
  @override
  _FlightListState createState() => _FlightListState();
}

class _FlightListState extends State<FlightList_Page> {

  @override
  @override
  Widget build(BuildContext context) {
    ActivityTimer.context = context;
    ActivityTimer.instance.resetTimer();
    return AlertDialog(
        content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 50,
                  width: 200,
                  child:
                  Text(AppLocalizations.of(context).flightListTitle,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),)
              ),
              Container(
                  height: 700,
                  width: 700,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child:
                  Column(
                    children: [
                      Container(//first row container
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                          ),
                          child: Row(//first row
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 25, left: 40),
                                  child:
                                  Text(
                                    AppLocalizations.of(context).flightListRow,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    AppLocalizations.of(context).flightListAirline,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    AppLocalizations.of(context).flightListFrom,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    AppLocalizations.of(context).flightListTo,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    AppLocalizations.of(context).flightListTime,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    AppLocalizations.of(context).flightListStatus,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                            ],
                          )
                      ),
                      Container(//first row container
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1),
                          ),
                          child: Row(//first row
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 25, left: 40),
                                  child:
                                  Text(
                                    "Row No.",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Airline",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "From",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "To",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Flight Time",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Status",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                            ],
                          )
                      ),
                      Container(//first row container
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(width: 1),
                          ),
                          child: Row(//first row
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 25, left: 40),
                                  child:
                                  Text(
                                    "Row No.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Airline",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "From",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "To",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Flight Time",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Status",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                            ],
                          )
                      ),
                      Container(//first row container
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1),
                          ),
                          child: Row(//first row
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 25, left: 40),
                                  child:
                                  Text(
                                    "Row No.",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Airline",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "From",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "To",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Flight Time",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Status",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                            ],
                          )
                      ),
                      Container(//first row container
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(width: 1),
                          ),
                          child: Row(//first row
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 25, left: 40),
                                  child:
                                  Text(
                                    "Row No.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Airline",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "From",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "To",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Flight Time",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Status",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                            ],
                          )
                      ),
                      Container(//first row container
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1),
                          ),
                          child: Row(//first row
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 25, left: 40),
                                  child:
                                  Text(
                                    "Row No.",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Airline",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "From",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "To",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Flight Time",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Status",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                            ],
                          )
                      ),
                      Container(//first row container
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(width: 1),
                          ),
                          child: Row(//first row
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 25, left: 40),
                                  child:
                                  Text(
                                    "Row No.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Airline",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "From",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "To",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Flight Time",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Status",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                            ],
                          )
                      ),
                      Container(//first row container
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1),
                          ),
                          child: Row(//first row
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 25, left: 40),
                                  child:
                                  Text(
                                    "Row No.",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Airline",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "From",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "To",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Flight Time",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Status",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                            ],
                          )
                      ),
                      Container(//first row container
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(width: 1),
                          ),
                          child: Row(//first row
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 25, left: 40),
                                  child:
                                  Text(
                                    "Row No.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Airline",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "From",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "To",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Flight Time",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Status",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                            ],
                          )
                      ),
                      Container(//first row container
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1),
                          ),
                          child: Row(//first row
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 25, left: 40),
                                  child:
                                  Text(
                                    "Row No.",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Airline",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "From",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "To",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Flight Time",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Status",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                            ],
                          )
                      ),
                      Container(//first row container
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))
                          ),
                          child: Row(//first row
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 25, left: 40),
                                  child:
                                  Text(
                                    "Row No.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Airline",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "From",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "To",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Flight Time",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child:
                                  Text(
                                    "Status",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  )
                              ),
                            ],
                          )
                      ),

                    ],
                  )
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
            ]
        )
    );
  }
}