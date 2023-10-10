import 'package:flutter/foundation.dart';

class Transaction {
  String txnId;
  String txnTitle;
  double txnAmount;
  DateTime txnDateTime;

  Transaction(
      {@required this.txnId,
      @required this.txnAmount,
      @required this.txnTitle,
      @required this.txnDateTime});
}
