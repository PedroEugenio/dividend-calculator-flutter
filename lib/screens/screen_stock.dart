import 'package:dividend_calculator_flutter/modules/stock_card_state.dart';
import 'package:dividend_calculator_flutter/modules/stock_card.dart';
import 'package:dividend_calculator_flutter/modules/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenStock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<StockCardState>(
      builder: (context, schedule, _) => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey[850],
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: SearchBar(),
                ),
                Flexible(
                  child: StockCard(),
                ),
/*                 Flexible(
                  child: StockApi(schedule.stockSymbol),
                ), */
              ],
            ),
          )),
    );
  }
}
