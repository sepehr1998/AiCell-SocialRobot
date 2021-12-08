
import 'dart:developer';

import 'package:aicell/pages/FacePage.dart';
import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aicell/connections/CoreConnector.dart';

class ActivityTimer {
  static ActivityTimer _instance = ActivityTimer._();

  static BuildContext _context;

  static BuildContext get context => _context;

  static ActivityTimer get instance => _instance ??= ActivityTimer._();

  static set context(BuildContext context){
    _context = context;
  }

  RestartableTimer _timer = new RestartableTimer(new Duration(minutes: 5),() =>{
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => face()),
  )
  });

  void resetTimer(){
    log("resetting timer for functionality");
    CoreConnector.instance.changeUIStateToCore("start");
    _timer.reset();
  }

  RestartableTimer get timer => _timer;

  ActivityTimer._();


}