
class States {
  static States _instance = States._();

  String _language;

  String get language => _language;

  States._();

  set language(String language){
    _language = language;
  }

  static States get instance => _instance ??= States._();


}