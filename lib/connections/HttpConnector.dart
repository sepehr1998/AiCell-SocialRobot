import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../States.dart';


Future<http.Response> touched() async {
  var url = Uri.parse('http://localhost:5002/touch');
  var response = await http.post(url,
      body: jsonEncode({'touched': 'True'}),
      headers: {"content-type": "application/json"});
  return response;
}


Future<http.Response> getPlaces() async {
  var url = Uri.parse('http://localhost:5002/send_places');
  var response = await http.get(url,
      headers: {"content-type": "application/json"});
  return response;
}

Future<String> getWeather(String city) async {
  var url = Uri.parse('http://localhost:8000/weather?q=' + city + '&appid=b8563a6551279ccbfe066c7f77dd3293&units=metric');
  var response = await http.get(url,
      headers: {"content-type": "application/json"});
  return response.body;
}

Future<String> goToGateCommand(String gateName) async {
  var url = Uri.parse('http://localhost:5002/go_to?name='+ gateName);
  var response = await http.get(url,
      headers: {"content-type": "application/json"});
  return response.body;
}

Future<http.Response> getState() async {
  var url = Uri.parse('http://localhost:5002/send_ui_state');
  var response = await http.get(url,
      headers: {"content-type": "application/json"});
  return response;
}

Future<http.Response> getHotels(String query) async {
  var url = Uri.parse('https://ws.alibaba.ir/api/v2/hotel/suggest?query='+query);
  var response = await http.get(url,
      headers: {"content-type": "application/json"});
  return response;
}

Future<http.Response> setUIState(String state) async {
  var url = Uri.parse('http://localhost:5002/get_ui_state');
  var response = await http.post(url,
      body: jsonEncode({'state': state}),
      headers: {"content-type": "application/json"});
  return response;
}


Future<http.Response> languageSelected(String language) async {
  var url = Uri.parse('http://localhost:5002/language');
  var response = await http.post(url,
      body: jsonEncode({'touched': 'True', 'language': language}),
      headers: {"content-type": "application/json"});
  return response;
}


Future<http.Response> getPlaceTypes() async {
  var url = Uri.parse('http://localhost:5002/place_types');
  var response = await http.get(url,
      headers: {"content-type": "application/json"});
  return response;
}

Future<http.Response> changePlaceMap(double curntX,double curnty,double destX,double destY) async {
  var url = Uri.parse('http://localhost:8000/QR_CODE?'+
      'loc=('+ curntX.toString() +','+curnty.toString()+')'+
      '&dis=('+ destX.toString() +','+destY.toString()+')');
  var response = await http.get(url,
      headers: {"content-type": "application/json",
                "x-access-token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwdWJsaWNfaWQiOiIwZGFkYTA2Zi0zZjkwLTRlZDQtYmM5NS01MDFmNDM1MzcwZWQiLCJleHAiOjI1MzQwMjMwMDc5OX0.rxTermTn3Utv-TY2EsBZtuMf7uaGdcM8RKKLwA7amQ8"
  });
  return response;
}

Future<http.Response> sendFeedback(int feedback) async {
  var url = Uri.parse('http://localhost:5002/feedback');
  var response = await http.post(url,
      body: jsonEncode({'feedback': feedback}),
      headers: {"content-type": "application/json"});
  return response;
}


Future<http.Response> sendSMS(String phoneNumber, String delay,String gateState, String id) async {
  var url = Uri.parse('http://localhost:5002/alarm?'
      + 'id=' + id
      + 'user_time=' + delay
      + 'status=' + gateState
      + 'sms=' + phoneNumber
      + 'lan=' + States.instance.language);
  log('sms send to : ' + phoneNumber + 'with language: ' + States.instance.language);
  var response = await http.get(url,
      headers: {"content-type": "application/json"});
  return response;
}