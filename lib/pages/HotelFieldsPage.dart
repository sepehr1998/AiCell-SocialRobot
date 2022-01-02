import 'package:aicell/connections/HttpConnector.dart';
import 'package:aicell/pages/AlibabaModal.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead_web/cupertino_flutter_typeahead.dart';
import 'package:flutter_typeahead_web/flutter_typeahead.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HotelFields extends StatefulWidget {
  @override
  _HotelFieldsState createState() => _HotelFieldsState();
}

class _HotelFieldsState extends State<HotelFields> {
  int adults = 1;
  int children = 1;
  String city;
  int numOfChild=0;
  int numOfAdult=1;
  String entranceDate;
  String leavingDate;
  String inputText;
  final TextEditingController _typeAheadController = TextEditingController();


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
                  Text(AppLocalizations.of(context).destCity, style: TextStyle(
                    fontSize: 24,
                  ),),
                ),
                Container(
                  height: 100,
                  width: 400,
                  child: TypeAheadField(
                    itemBuilder: (context, itemData) {
                      return ListTile(
                        title: Text(itemData['title'],
                          style: TextStyle(
                            fontFamily: 'OtomanopeeOne',
                          ),
                        ),
                        subtitle: Text(itemData['country'],
                        style: TextStyle(
                            fontFamily: 'OtomanopeeOne',
                        ),
                        )
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      setState(() {
                        city = 'City_'+suggestion['id']+'_'+suggestion['city'];
                      });
                      this._typeAheadController.text = suggestion['city'];
                    },
                    suggestionsCallback: getHotels,
                    textFieldConfiguration: TextFieldConfiguration(
                        autofocus: true,
                        controller: this._typeAheadController,
                        style: DefaultTextStyle.of(context).style.copyWith(
                            fontStyle: FontStyle.italic,
                            fontFamily: 'OtomanopeeOne',
                          decoration: TextDecoration.none,
                          color: Colors.black
                        ),
                        decoration: InputDecoration(
                            border: OutlineInputBorder()
                        )
                    ),
                  )
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
                  Text(AppLocalizations.of(context).entranceDate, style: TextStyle(
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
                  Text(AppLocalizations.of(context).leavingDate, style: TextStyle(
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
                    Text(AppLocalizations.of(context).adults, style: TextStyle(
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
                    Text(AppLocalizations.of(context).children, style: TextStyle(
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
                child: Text(AppLocalizations.of(context).search, style: TextStyle(
                    fontSize: 30
                ),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  AlibabaModal_Page(
                          departing: entranceDate,
                          destCity: city,
                          returning: leavingDate,
                        )),);

                }
                ,
              ),
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
