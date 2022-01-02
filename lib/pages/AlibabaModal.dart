import 'package:aicell/components/ActivityTimer.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AlibabaModal_Page extends StatelessWidget {

  const AlibabaModal_Page({Key key, this.destCity, this.departing, this.returning, this.rooms = "30"}) : super(key: key);

  final String destCity;
  final String departing;
  final String returning;
  final String rooms;

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
                width: 800,
                height: 600,
                margin: EdgeInsets.only(bottom: 30),
                child:
                EasyWebView(
                  src: "http://localhost:8000/hotel/search?destination="+destCity
                      +"&departing="+departing
                      +"&returning="+returning
                      +"&rooms="+rooms,
                  key: Key("Alibaba"),
                  isHtml: false,
                  isMarkdown: false,
                  convertToWidgets: false,
                  onLoaded: (){
                    print('loaded');
                  },
                ) ,
            ),

            Container(
              width: 700,
              height: 100,
              child: ElevatedButton(
                child: Text(AppLocalizations.of(context).closeBtn, style: TextStyle(
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
