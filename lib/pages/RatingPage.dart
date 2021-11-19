
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating_Page extends StatefulWidget {
  @override
  _RatingState createState() => _RatingState();
}
enum SingingCharacter { opening, closing }
class _RatingState extends State<Rating_Page> {
  SingingCharacter _character = SingingCharacter.opening;
  @override
  @override
  Widget build(BuildContext context) {
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
                    "Please give us your feedback",
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
                      print(rating);
                    },
                  )
                ),
              ],
            ),
            Container(
              width: 700,
              height: 100,
              child: ElevatedButton(
                child: Text("Send", style: TextStyle(
                    fontSize: 30
                ),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }
                ,
              ),
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


