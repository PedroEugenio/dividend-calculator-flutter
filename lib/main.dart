import 'package:dividend_calculator_flutter/modules/stock_card_state.dart';
import 'package:dividend_calculator_flutter/screens/screen_stock.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dividend Calculator',
      theme: ThemeData(
        backgroundColor: Colors.grey[850],
        primaryColor: Colors.grey[850],
        accentColor: Colors.grey[850],
      ),
      home: ChangeNotifierProvider(
          create: (context) => StockCardState(), child: ScreenStock()),
    );
  }
}
