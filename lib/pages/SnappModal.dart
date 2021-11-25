import 'package:dotted_border/dotted_border.dart';
import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SnappModal_Page extends StatefulWidget {
  @override
  _SnappModalState createState() => _SnappModalState();
}

class _SnappModalState extends State<SnappModal_Page> {

  @override
  @override
  Widget build(BuildContext context) {
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
                  src: "https://app.snapp.taxi/login/?redirect_to=%2F",
                  key: Key("Snapp"),
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
                child: Text("Close", style: TextStyle(
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
