import 'package:dividend_calculator_flutter/modules/stock_api.dart';
import 'package:flutter/material.dart';

class ScreenStock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: StockApi(),
        ));
  }
}
