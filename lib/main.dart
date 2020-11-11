import 'package:dividend_calculator_flutter/modules/MySchedule.dart';
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
        primarySwatch: Colors.amber,
      ),
      home: ChangeNotifierProvider(
          create: (context) => MySchedule(), child: ScreenStock()),
    );
  }
}
