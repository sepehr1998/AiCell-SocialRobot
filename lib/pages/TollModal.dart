import 'package:dotted_border/dotted_border.dart';
import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TollModal_Page extends StatefulWidget {
  @override
  _TollModalState createState() => _TollModalState();
}

class _TollModalState extends State<TollModal_Page> {

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
                height: 1000,
                margin: EdgeInsets.only(bottom: 30),
                child:
                EasyWebView(
                  src: "https://sadadpsp.ir/Tollpayment/",
                  key: Key("Toll"),
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
