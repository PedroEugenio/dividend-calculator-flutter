import 'package:flutter/foundation.dart';

class MySchedule with ChangeNotifier {
  String _stockSymbol;

  String get stockSymbol => _stockSymbol;

  set stockSymbol(String newString) {
    _stockSymbol = newString;
    notifyListeners();
  }
}
