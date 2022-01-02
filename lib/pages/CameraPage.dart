
import 'package:aicell/components/ActivityTimer.dart';
import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../connections/CoreConnector.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Camera_Page extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera_Page> {

  @override
  @override
  Widget build(BuildContext context) {
    ActivityTimer.context = context;
    ActivityTimer.instance.resetTimer();
    return Container(
        width: 700,
        height: 700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 640,
              height: 480,
              child:
              EasyWebView(
                src: "http://localhost:5002/",
                key: Key("Camera"),
                isHtml: false,
                isMarkdown: false,
                convertToWidgets: false,
                onLoaded: (){
                  print('loaded');
                },
              ) ,
            ),
            Container(
              width: 640,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                width: 100,
                height: 80,
                child: ElevatedButton(
                  child: Text(AppLocalizations.of(context).backBtn),
                  onPressed: () {
                    CoreConnector.instance.changeUIStateToCore("alpha");
                  }
                  ,
                ),
              ),
            ),
          ],
        )
    );
  }
}

