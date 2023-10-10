import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTxn;

  NewTransaction(this.addTxn);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final txnTitleController = TextEditingController();
  final txnAmountController = TextEditingController();
  DateTime chosenDate;

  void submitData() {
    var txnTitle = txnTitleController.text;
    var txnAmount = double.parse(txnAmountController.text);
    if (txnTitle.isEmpty || txnAmount <= 0 || chosenDate == null) {
      return;
    }
    widget.addTxn(
      txnTitle,
      txnAmount,
      chosenDate,
    );

    Navigator.of(context).pop();
  }

  void openDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        chosenDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'title',
              ),
              controller: txnTitleController,
              onSubmitted: (_) => submitData(),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: TextField(
              decoration: InputDecoration(labelText: 'amount'),
              controller: txnAmountController,
              onSubmitted: (_) => submitData(),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  chosenDate == null
                      ? 'No date chosen'
                      : DateFormat.MEd().format(chosenDate),
                  style: TextStyle(color: Color.fromRGBO(0, 0, 0, 80)),
                ),
                TextButton(
                  onPressed: openDatePicker,
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.amber)),
                  child: Text(
                    'Pick Date',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          TextButton(
            onPressed: submitData,
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.amber)),
            child: Text(
              'Add Transaction',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
