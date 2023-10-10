import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transactions.dart';
import './chartsBar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTxns;

  Chart(this.recentTxns);

  List<Map<String, Object>> get groupedTxnValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < recentTxns.length; i++) {
        if (recentTxns[i].txnDateTime.day == weekDay.day &&
            recentTxns[i].txnDateTime.month == weekDay.month &&
            recentTxns[i].txnDateTime.year == weekDay.year) {
          totalSum += recentTxns[i].txnAmount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalExpense {
    var total = 0.0;
    for (int i = 0; i < recentTxns.length; i++) {
      total += recentTxns[i].txnAmount;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTxnValues.map((txnData) {
            return ChartBar(
              label: txnData['day'],
              expenseAmt: txnData['amount'],
              exAmtPct: totalExpense == 0
                  ? 0.0
                  : (txnData['amount'] as double) / totalExpense,
            );
          }).toList(),
        ),
      ),
    );
  }
}
