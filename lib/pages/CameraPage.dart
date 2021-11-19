
import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../connections/NatsConnector.dart';



class Camera_Page extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera_Page> {

  @override
  @override
  Widget build(BuildContext context) {
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
                  child: Text("بازگشت"),
                  onPressed: () {
                    NatsConnector.instance.changeUIStateToCore("alpha");
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

