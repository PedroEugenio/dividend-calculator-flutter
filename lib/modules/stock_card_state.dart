import 'package:dividend_calculator_flutter/modules/stock.dart';
import 'package:flutter/foundation.dart';

class StockCardState with ChangeNotifier {
  String _stockSymbol = "";
  Stock _stock;

  Stock get stock => _stock;

  String get stockSymbol => _stockSymbol;

  set stockSymbol(String newString) {
    _stockSymbol = newString;
    notifyListeners();
  }

  set stock(Stock newStock) {
    _stock = newStock;
    notifyListeners();
  }
}
