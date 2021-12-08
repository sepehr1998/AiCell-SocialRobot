
import 'package:aicell/components/ActivityTimer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SMS_Page extends StatefulWidget {
  @override
  _SMSState createState() => _SMSState();
}
enum SingingCharacter { opening, closing }
class _SMSState extends State<SMS_Page> {
  SingingCharacter _character = SingingCharacter.opening;

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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 100,
                  width: 200,
                  child:
                  Text("Mobile Number: ", style: TextStyle(
                    fontSize: 24,
                  ),),
                ),
                Container(
                  height: 100,
                  width: 400,
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your phone number'
                    ),
                  ),
                ),
              ],
            ),
            RadioListTile<SingingCharacter>(
              title: const Text('Opening Time',
              style: TextStyle(
                fontSize: 24
              ),),
              value: SingingCharacter.opening,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<SingingCharacter>(
              title: const Text('Closing Time',
              style: TextStyle(
                fontSize: 24
              ),),
              value: SingingCharacter.closing,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            Container(
              width: 700,
              height: 100,
              margin: EdgeInsets.only(top: 50),
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


