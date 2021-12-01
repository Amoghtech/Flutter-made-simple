import 'package:daily_expenses_app/models/transaction.dart';
import 'package:daily_expenses_app/widgets/chart.dart';

import './widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Personal Expenses',
        home: MyHomePage(),
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.amber,
            fontFamily: 'Quicksand',
            textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                button: TextStyle(color: Colors.white)),
            appBarTheme: AppBarTheme(
                textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold)))));
  }
}

class MyHomePage extends StatefulWidget {
  // String titleinput;
  // String amountinput;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> userTransaction = [
    // Transaction(
    //     id: 't1',
    //     title: 'New Shoes',
    //     amount: 69.99,
    //     date: DateTime.now().subtract(Duration(days: 1))),
    // Transaction(
    //     id: 't2',
    //     title: 'New Tshirts',
    //     amount: 45.54,
    //     date: DateTime.now().subtract(Duration(days: 2)))
  ];

  List<Transaction> get _recenttransactions {
    return userTransaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addnewtransaction(String title, double amount, DateTime date) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        id: DateTime.now().toString(),
        date: date);
    setState(() {
      userTransaction.add(newTx);
    });
  }

  void _startaddnewtransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: NewTransaction(_addnewtransaction));
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      userTransaction.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startaddnewtransaction(context);
        },
      ),
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _startaddnewtransaction(context);
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Chart(_recenttransactions),
          TransactionList(userTransaction, _deleteTransaction),
        ],
      ),
    );
  }
}
