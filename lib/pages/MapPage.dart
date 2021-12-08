import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class GetMap_Page extends StatelessWidget {

  const GetMap_Page({Key key, this.curntX, this.curnty, this.destX, this.destY}) : super(key: key);

  final double curntX;
  final double curnty;
  final double destX;
  final double destY;


  loadImageByLocation(double curntX, double curnty, double destX, double destY){
    if(this.curntX != null && this.curnty != null && this.destX != null && this.destY != null){
      return Image.network("http://194.5.188.218:5011/data.png");
    } else{
      return CachedNetworkImage(imageUrl: 'http://194.5.188.218:5010/QR_CODE?'+
          'loc=('+ curntX.toString() +','+curnty.toString()+')'+
          '&dis=('+ destX.toString() +','+destY.toString()+')',
        httpHeaders: {
          "content-type": "application/json",
          "x-access-token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwdWJsaWNfaWQiOiIwZGFkYTA2Zi0zZjkwLTRlZDQtYmM5NS01MDFmNDM1MzcwZWQiLCJleHAiOjI1MzQwMjMwMDc5OX0.rxTermTn3Utv-TY2EsBZtuMf7uaGdcM8RKKLwA7amQ8"
        },

      );
    }
  }

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
                // Image.asset("assets/features.png")
                Image.network("http://194.5.188.218:5011/map.png")
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
              child: //Image.asset("assets/direction.png"),
              loadImageByLocation(curntX, curnty, destX, destY)
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
