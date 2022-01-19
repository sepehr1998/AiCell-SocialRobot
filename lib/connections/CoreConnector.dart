import 'package:dart_nats/dart_nats.dart';
import 'package:aicell/connections/HttpConnector.dart';
import 'package:flutter/cupertino.dart';

class CoreConnector {
  static CoreConnector _instance = CoreConnector._();

  String _state = "start";

  Locale _locale = Locale('en');

  var _client = Client();

  Client get client => _client;

  String get state => _state;

  CoreConnector._();

  set state(String state){
    _state = state;
  }

  set locale(Locale locale){
    _locale = locale;
  }

  static CoreConnector get instance => _instance ??= CoreConnector._();


  void sendUIStateToCore(String state){
    client.pubString('UI2CORE', state);
    // setUIState(state);
  }


  void changeUIStateToCore(String state){
    _state = state;
    // setUIState(_state);
    client.pubString('UI2CORE', state);

  }

  void sendFeedback(int feedback){
    client.pubString('feedback', feedback.toString());
  }

  void connect() async{
    await client.connect(Uri.parse('ws://'+Uri.base.host+':80'));
    sendUIStateToCore(state);
  }


}