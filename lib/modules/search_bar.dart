import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MySchedule.dart';

class SearchBar extends StatelessWidget {
  final inputTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final schedule = Provider.of<MySchedule>(context);
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
                style: TextStyle(fontSize: 28),
                textInputAction: TextInputAction.go,
                controller: inputTextController,
                onChanged: (value) => {
                  if (value.length > 0) {schedule.stockSymbol = value}
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
