

import 'package:aicell/connections/HttpConnector.dart';
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


class face extends StatefulWidget {
  @override
  _faceState createState() => _faceState();
}

class _faceState extends State<face> {


  @override
  Widget build(BuildContext context) {
    // Timer getTimer = new Timer.periodic(timerDurationGet, syncState);
    return GestureDetector(
      onTap: () {
          CoreConnector.instance.changeUIStateToCore("choose_language");
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
