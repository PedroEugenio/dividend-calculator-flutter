import 'package:dividend_calculator_flutter/modules/stock.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class StockApi {
  String stockSymbol;

  StockApi({this.stockSymbol});

  Future<Stock> getStockData() async {
    var response = await http.get(
        'https://www.alphavantage.co/query?function=OVERVIEW&symbol=' +
            stockSymbol +
            '&apikey=HKF0BL9NRACHHXW8');
    if (response.statusCode == 200) {
      return compute(parseApiStockResponse, response.body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  Stock parseApiStockResponse(String responseBody) {
    var jsonResponse = convert.jsonDecode(responseBody);
    print(jsonResponse);
    return Stock.fromJSON(jsonResponse);
  }
}
