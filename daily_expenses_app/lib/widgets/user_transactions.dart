import 'package:daily_expenses_app/widgets/new_transaction.dart';
import 'package:daily_expenses_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Tshirts', amount: 45.54, date: DateTime.now())
  ];

  void _addnewtransaction(title, amount) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        id: DateTime.now().toString(),
        date: DateTime.now());
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [NewTransaction(_addnewtransaction), TransactionList(_userTransaction)],
    );
  }
}
