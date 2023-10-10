import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './model/transactions.dart';
import './widgets/txnList.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
      theme: ThemeData(accentColor: Colors.black, primaryColor: Colors.black),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTxns = [];

  List<Transaction> get _recentTransactions {
    return _userTxns.where((txn) {
      return txn.txnDateTime.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTxn(String txnTitle, double txnAmount, DateTime date) {
    final newTxn = Transaction(
      txnAmount: txnAmount,
      txnDateTime: date,
      txnId: DateTime.now().toString(),
      txnTitle: txnTitle,
    );

    setState(() {
      _userTxns.add(newTxn);
    });
  }

  void startAddNewTxn(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTxn);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              startAddNewTxn(context);
            },
          ),
        ],
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Chart(_recentTransactions),
          TxnList(_userTxns),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black),
            backgroundColor: MaterialStateProperty.all(Colors.amber[600])),
        child: Icon(Icons.add),
        onPressed: () {
          startAddNewTxn(context);
        },
      ),
    );
  }
}
