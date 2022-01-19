
import 'dart:developer';

import 'package:aicell/components/ActivityTimer.dart';
import 'package:aicell/connections/CoreConnector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:html' as html;


class Rating_Page extends StatefulWidget {
  @override
  _RatingState createState() => _RatingState();
}
enum SingingCharacter { opening, closing }
class _RatingState extends State<Rating_Page> {
  SingingCharacter _character = SingingCharacter.opening;
  double _rating;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 400,
                  child: Text(
                    AppLocalizations.of(context).feedBackTxt,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 100,
                  width: 250,
                  child:
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      _rating = rating;
                    },
                  )
                ),
              ],
            ),
            Container(
              width: 700,
              height: 100,
              child: ElevatedButton(
                child: Text(AppLocalizations.of(context).sendBtn, style: TextStyle(
                    fontSize: 30
                ),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () {
                  CoreConnector.instance.sendFeedback(_rating.toInt());
                  html.window.location.reload();
                }
                ,
              ),
            ),
            Container(
              width: 700,
              height: 100,
              child: ElevatedButton(
                child: Text(AppLocalizations.of(context).backBtn, style: TextStyle(
                    fontSize: 30
                ),),
                onPressed: () {
                  Navigator.pop(context);
                }
                ,
              ),
            ),
          ],
        )
    );
  }
}


