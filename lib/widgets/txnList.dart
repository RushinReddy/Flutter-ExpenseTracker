import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transactions.dart';

class TxnList extends StatelessWidget {
  final List<Transaction> transactions;

  TxnList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Container(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  'There Are No Transactions Yet',
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 100),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/zzz.png',
                    fit: BoxFit.scaleDown,
                  ),
                )
              ],
            ),
          )
        : Container(
            height: 600,
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10,
                  color: Colors.black,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: Text(
                          'Rs. ${transactions[index].txnAmount.toStringAsFixed(2)}',
                          style: TextStyle(
                              color: Colors.amber[600],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              transactions[index].txnTitle,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: Text(
                              DateFormat.MMMEd()
                                  .format(transactions[index].txnDateTime),
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          );
  }
}
