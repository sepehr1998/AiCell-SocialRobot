import 'package:aicell/components/ActivityTimer.dart';
import 'package:aicell/connections/HttpConnector.dart';
import 'package:aicell/widgets/Header.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persian_fonts/persian_fonts.dart';
import '../connections/CoreConnector.dart';
import '../States.dart';
import '../main.dart';

class Languages_Page extends StatefulWidget {
  @override
  _LanguagesState createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages_Page> {


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
                        // languageSelected(States.instance.language).then((value) {
                        //   if(value.statusCode ==200) {
                            AiCell.of(context).setLocale(Locale('en'));
                            CoreConnector.instance.changeUIStateToCore("alpha");
                        //   }
                        // });
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
                        // languageSelected(States.instance.language).then((value) {
                        //   if(value.statusCode ==200) {
                            CoreConnector.instance.changeUIStateToCore("alpha");
                            AiCell.of(context).setLocale(Locale('fa'));
                        //   }
                        // });
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