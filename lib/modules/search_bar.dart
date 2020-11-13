import 'package:dividend_calculator_flutter/modules/stock.dart';
import 'package:dividend_calculator_flutter/modules/stock_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'stock_card_state.dart';

/* Future<Stock> getStockData(String stockSymbol) async {
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
} */

class SearchBar extends StatelessWidget {
  final inputTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final schedule = Provider.of<StockCardState>(context);

    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.amber[200],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: (screenWidth < 500) ? screenWidth * 0.9 : screenWidth * 0.4,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 8,
              child: TextField(
                autofocus: false,
                style: TextStyle(fontSize: 28),
                textInputAction: TextInputAction.search,
                controller: inputTextController,
                onSubmitted: (value) async {
                  if (inputTextController.value.toString().length > 0 &&
                      inputTextController.value.toString() !=
                          schedule.stockSymbol) {
                    schedule.stockSymbol = inputTextController.value.text;
                    schedule.stock =
                        await StockApi(stockSymbol: schedule.stockSymbol)
                            .getStockData();
                  }
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  if (inputTextController.value.toString().length > 0 &&
                      inputTextController.value.toString() !=
                          schedule.stockSymbol) {
                    schedule.stockSymbol = inputTextController.value.text;
                    schedule.stock =
                        await StockApi(stockSymbol: schedule.stockSymbol)
                            .getStockData();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
