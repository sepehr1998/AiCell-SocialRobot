import 'package:dart_nats/dart_nats.dart';


class NatsConnector {
  static NatsConnector _instance = NatsConnector._();

  String _state = "start";

  var _client = Client();

  Client get client => _client;

  String get state => _state;

  NatsConnector._();

  set state(String state){
    _state = state;
  }

  static NatsConnector get instance => _instance ??= NatsConnector._();


  void sendUIStateToCore(String state){
    client.pubString('UI2CORE', state);
  }


  void changeUIStateToCore(String state){
    _state = state;
    client.pubString('UI2CORE', state);
  }


  void connect() async{
    await client.connect(Uri.parse('ws://localhost:80'));
    sendUIStateToCore(state);
  }


}