import 'package:dividend_calculator_flutter/modules/MySchedule.dart';
import 'package:dividend_calculator_flutter/modules/stock_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenStock extends StatelessWidget {
  final inputTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final schedule = Provider.of<MySchedule>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () {
                schedule.stockSymbol = inputTextController.text;
              },
              icon: Icon(Icons.search),
            )
          ],
          centerTitle: true,
          title: TextField(
            textInputAction: TextInputAction.go,
            controller: inputTextController,
            onChanged: (value) => {
              if (value.length > 0) {schedule.stockSymbol = value}
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Flexible(child: StockApi())],
          ),
        ));
  }
}
