import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double expenseAmt;
  final double exAmtPct;

  ChartBar({
    this.label,
    this.exAmtPct,
    this.expenseAmt,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 45,
          child: Container(
            height: 25,
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Rs.${expenseAmt.toStringAsFixed(0)}',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 100,
          width: 15,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            FractionallySizedBox(
              heightFactor: exAmtPct,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber[700],
                ),
              ),
            )
          ]),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
