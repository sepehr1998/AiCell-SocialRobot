import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class GetMap_Page extends StatefulWidget {
  @override
  _GetMapState createState() => _GetMapState();
}

class _GetMapState extends State<GetMap_Page> {

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
                Image.asset("assets/features.png")
            ),
            DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(20),
              color: Colors.blue,
              strokeWidth: 10,
              dashPattern: [6, 3, 2, 3],
              child:
              Container(
                  margin: EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Text("You can download this map by scanning QR code bellow",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  )
              ),
            ),
            Container(
              height: 300,
              width: 300,
              margin: EdgeInsets.only(top: 50, bottom: 50),
              child: Image.asset("assets/direction.png"),
            ),
            Container(
              width: 700,
              height: 100,
              child: ElevatedButton(
                child: Text("Back", style: TextStyle(
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
