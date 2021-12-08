

import 'package:aicell/connections/HttpConnector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../connections/CoreConnector.dart';
import '../pages/LanguagePage.dart';
import '../pages/TicketPage.dart';
import '../pages/CameraPage.dart';
import 'FunnctionsPage.dart';


class face extends StatefulWidget {
  @override
  _faceState createState() => _faceState();
}

class _faceState extends State<face> {

  var client = CoreConnector.instance.client;

  @override
  Widget build(BuildContext context) {
    // Timer getTimer = new Timer.periodic(timerDurationGet, syncState);
    var sub = client.sub("CORE2UI");
    sub.stream.listen((event) {
      CoreConnector.instance.state = event.string;
      print("ui state changed to: "+ CoreConnector.instance.state);
      switch (CoreConnector.instance.state) {
        case "choose_language":
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Directionality(textDirection: TextDirection.ltr, child: Languages_Page())),
          );
          break;
        case "start":
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Directionality(textDirection: TextDirection.ltr, child:face())),
          );
          break;
        case "introduction":
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Directionality(textDirection: TextDirection.ltr, child:face())),
          );
          break;
        case "wait_move":
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Directionality(textDirection: TextDirection.ltr, child:face())),
          );
          break;
        case "move_to_destination":
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Directionality(textDirection: TextDirection.ltr, child:face())),
          );
          break;
        case "goodbye":
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Directionality(textDirection: TextDirection.ltr, child:face())),
          );
          break;
        case "wait_ticket":
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Directionality(textDirection: TextDirection.ltr, child:Ticket_Page())),
          );
          break;
        case "ticket":
          showDialog(context: context, builder: (context) =>  Directionality(textDirection: TextDirection.ltr, child:Camera_Page()), barrierDismissible: false);
          break;
        case "alpha":
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Directionality(textDirection: TextDirection.ltr, child:Functions_Page())),
          );
          break;
        case "mask_error":
          showDialog(context: context, builder: (context) =>  Directionality(textDirection: TextDirection.ltr, child:Camera_Page()),  barrierDismissible: false);
          break;
      }
    });
    return GestureDetector(
      onTap: () {
        touched().then((value) {
          if (value.statusCode == 200) {
            CoreConnector.instance.changeUIStateToCore("choose_language");
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
