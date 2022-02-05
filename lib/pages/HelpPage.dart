

import 'package:aicell/pages/FacePage.dart';
import 'package:aicell/pages/FlightListPage.dart';
import 'package:aicell/pages/ForbiddenItemsPage.dart';
import 'package:aicell/pages/HotelFieldsPage.dart';
import 'package:aicell/pages/InformationPage.dart';
import 'package:aicell/pages/PlacesPage.dart';
import 'package:aicell/pages/ServicesPage.dart';
import 'package:aicell/pages/SnappModal.dart';
import 'package:aicell/pages/TollModal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../connections/CoreConnector.dart';
import '../pages/LanguagePage.dart';
import '../pages/TicketPage.dart';
import '../pages/CameraPage.dart';
import 'FunnctionsPage.dart';


class HelpPage extends StatefulWidget {
  @override
  HelpPageState createState() => HelpPageState();
}

class HelpPageState extends State<HelpPage> {

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
            MaterialPageRoute(builder: (context) =>  Directionality(textDirection: TextDirection.ltr, child:HelpPage())),
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
        case "sevice_page":
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Directionality(textDirection: TextDirection.ltr, child:Services_Page())),
          );
          break;
        case "taxi_redirect":
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Directionality(textDirection: TextDirection.ltr, child:SnappModal_Page())),
          );
          break;
        case "toll_redirect":
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Directionality(textDirection: TextDirection.ltr, child:TollModal_Page())),
          );
          break;
        case "hotel_page":
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Directionality(textDirection: TextDirection.ltr, child:HotelFields())),
          );
          break;
        case "places_page":
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Directionality(textDirection: TextDirection.ltr, child:Places_Page())),
          );
          break;
        case "information_page":
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Directionality(textDirection: TextDirection.ltr, child:Information_Page())),
          );
          break;
        case "flight_list":
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Directionality(textDirection: TextDirection.ltr, child:FlightList_Page())),
          );
          break;
        case "forbidden_items":
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Directionality(textDirection: TextDirection.ltr, child:ForbiddenItems_Page())),
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
        CoreConnector.instance.changeUIStateToCore("choose_language");
      },
      child:Container(
          color: Colors.transparent,
          height: 1920,
          child:
          Image.asset("assets/aicellHowToUseFinall.gif")
      ) ,
    );
  }
}
