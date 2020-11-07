import 'dart:html';

import 'package:dividend_calculator_flutter/modules/stock.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<Stock> getStockData(String tickSymbol) async {
  var response = await http.get(
      'https://www.alphavantage.co/query?function=OVERVIEW&symbol=' +
          tickSymbol +
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

Widget createCardStock(Stock stockData) {
  return Container(
    width: 400.0,
    height: 300.0,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.amber[300],
      elevation: 10.0,
      //margin: EdgeInsets.all(100.0),
      child: InkWell(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 12.0),
              child: Text(
                stockData.symbol,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              stockData.name,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Text(
              'Dividend Yield: ' +
                  (stockData.dividendYield * 100).toStringAsFixed(2) +
                  '%',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            Text(
              'Ex-Dividend: ${stockData.exDividend.day}-${stockData.exDividend.month}-${stockData.exDividend.year}',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class StockApi extends StatelessWidget {
  final String tickSymbol = 'JNJ';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Stock>(
        future: getStockData(tickSymbol),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? createCardStock(snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
