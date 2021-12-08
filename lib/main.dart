import 'dart:async';
import 'dart:convert';
import 'package:aicell/pages/FacePage.dart';
import 'package:aicell/pages/FunnctionsPage.dart';
import 'package:aicell/pages/InformationPage.dart';
import 'package:aicell/pages/LanguagePage.dart';
import 'package:aicell/pages/PlacesPage.dart';
import 'package:aicell/pages/ServicesPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import './connections/CoreConnector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() {
  CoreConnector.instance.connect();
  runApp(AiCell());
}

class AiCell extends StatefulWidget {
  @override
  _AiCellState createState() => _AiCellState();

  static _AiCellState of(BuildContext context) => context.findAncestorStateOfType<_AiCellState>();
}

class _AiCellState extends State<AiCell> {

  Locale _locale = Locale('en');

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          locale: _locale,
          localizationsDelegates: [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            AppLocalizations.delegate
          ],
          supportedLocales: [
            Locale('en', ''),
            Locale('fa', ''),
          ],
          routes: {
            // When navigating to the "/second" route, build the SecondScreen widget.
            '/second': (context) => Functions_Page(),
            '/third': (context) => Languages_Page(),
            '/forth': (context) => Services_Page(),
            '/fifth': (context) => Information_Page(),
            '/sixth': (context) => Places_Page(),
          },
          home:
          Directionality(
            textDirection: TextDirection.ltr,
            child: face())
          );

  }
}
