import 'dart:developer';

import 'package:daily_expenses_app/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupTransaction {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));

      var totalsum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.month == weekday.month &&
            recentTransactions[i].date.year == weekday.year) {
          totalsum += recentTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekday));
      print(totalsum);
      return {'day': DateFormat.E().format(weekday), 'amount': totalsum};
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupTransaction);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [],
      ),
    );
  }
}
