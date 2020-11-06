import 'package:dividend_calculator_flutter/modules/stock.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<Stock> getStockData(String tickSymbol) async{
  var response = await http.get('https://www.alphavantage.co/query?function=OVERVIEW&symbol='+tickSymbol+'&apikey=HKF0BL9NRACHHXW8');
  if (response.statusCode == 200) {
    return compute(parseApiStockResponse, response.body);
  }
  else{
    print('Request failed with status: ${response.statusCode}.');
    return null;
  }
}

Stock parseApiStockResponse(String responseBody){
  var jsonResponse = convert.jsonDecode(responseBody);
  print(jsonResponse);
  return Stock.fromJSON(jsonResponse);
}

class StockApi extends StatelessWidget {
  final String tickSymbol = 'JNJ';

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: FutureBuilder<Stock>(
        future: getStockData(tickSymbol),
        builder: (context, snapshot){
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? RichText(
                text: TextSpan(
                  children: <TextSpan> [
                    TextSpan(text: snapshot.data.symbol),
                    TextSpan(text: snapshot.data.name),
                    TextSpan(text: snapshot.data.price.toString()),
                  ]
                )
              )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}