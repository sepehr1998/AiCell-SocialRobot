

import 'package:aicell/pages/PlacesPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BluePlaceButton extends StatelessWidget {

  const BluePlaceButton({Key key, this.label, this.margin}) : super(key: key);

  final String label;


  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return
      Container(
      margin: margin,
      height: 100,
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
              margin: EdgeInsets.only(top: 20),
              child:
              Text(
                label,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 45,
                  color: Colors.white,
                ),
              )
          )
        ],
      ),
    );
  }
}
