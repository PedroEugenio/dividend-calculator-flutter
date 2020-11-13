import 'package:dividend_calculator_flutter/modules/stock_card_state.dart';
import 'package:dividend_calculator_flutter/modules/stock.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StockCard extends StatefulWidget {
  @override
  _StockCardState createState() => _StockCardState();
}

class _StockCardState extends State<StockCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StockCardState>(
      builder: (context, schedule, _) => Container(
        child: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          front: createFrontCardStock(schedule.stock, 300, 200),
          back: createBackCardStock(schedule.stock, 300, 200),
        ),
      ),
    );
  }
}

Widget createFrontCardStock(Stock stockData, double width, double height) {
  if (stockData != null) {
    return Container(
      width: width,
      height: height,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.amber[200],
        elevation: 10.0,
        //margin: EdgeInsets.all(100.0),
        child: InkWell(
          child: Column(
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
            ],
          ),
        ),
      ),
    );
  } else {
    return Text("");
  }
}

Widget createBackCardStock(Stock stockData, double width, double height) {
  if (stockData != null) {
    return Container(
      width: width,
      height: height,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.amber[200],
        elevation: 10.0,
        //margin: EdgeInsets.all(100.0),
        child: InkWell(
          child: Column(
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
  } else {
    return Text("");
  }
}
