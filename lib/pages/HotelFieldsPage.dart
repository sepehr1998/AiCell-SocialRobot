import 'package:date_time_picker/date_time_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class HotelFields extends StatefulWidget {
  @override
  _HotelFieldsState createState() => _HotelFieldsState();
}

class _HotelFieldsState extends State<HotelFields> {
  int adults = 1;
  int children = 1;
  String city;
  int numOfChild;
  int numOfAdult;
  String entranceDate;
  String leavingDate;
  @override
  Widget build(BuildContext context) {
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
                  Text("Destination city: ", style: TextStyle(
                    fontSize: 24,
                  ),),
                ),
                Container(
                  height: 100,
                  width: 400,
                  child: AutoCompleteTextField(
                    itemBuilder: (context, item) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(item.autocompleteterm,
                            style: TextStyle(
                                fontSize: 16.0
                            ),),
                          Padding(
                            padding: EdgeInsets.all(15.0),
                          ),
                          Text(item.country,
                          )
                        ],
                      );
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your destination city',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 50,
                  width: 200,
                  child:
                  Text("Entrance Date: ", style: TextStyle(
                    fontSize: 24,
                  ),),
                ),
                Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child:
                    DateTimePicker(
                      initialValue: '',
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      onChanged: (value) {
                        setState(() {
                          entranceDate = value;
                        });
                      },
                    type: DateTimePickerType.date,
                    cursorColor:
                    Colors.transparent,

                    ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 50),
                  height: 50,
                  width: 200,
                  child:
                  Text("Leaving Date: ", style: TextStyle(
                    fontSize: 24,
                  ),),
                ),
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child:
                  DateTimePicker(
                    initialValue: '',
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    type: DateTimePickerType.date,
                    cursorColor:
                    Colors.transparent,
                    onChanged: (value) {
                      setState(() {
                        leavingDate = value;
                      });
                    },
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child:
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 50,
                    width: 220,
                    child:
                    Text("Number of adults: ", style: TextStyle(
                      fontSize: 24,
                    ),),
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    child:
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          numOfAdult = int.parse(value);
                        });
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: ''
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 30),
                    height: 50,
                    width: 220,
                    child:
                    Text("Number of children: ", style: TextStyle(
                      fontSize: 24,
                    ),),
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    child:
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          numOfChild = int.parse(value);
                        });
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: ''
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 700,
              height: 100,
              margin: EdgeInsets.only(top: 50),
              child: ElevatedButton(
                child: Text("Search", style: TextStyle(
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
