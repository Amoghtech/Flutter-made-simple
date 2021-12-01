import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletetrasaction;
  TransactionList(this.transactions, this.deletetrasaction);

  @override
  Widget build(BuildContext context) {
    return transactions.length == 0
        ? Column(
            children: [
              Text(
                "No Transactions Added Yet!",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ))
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              // return Card(
              //   child: Row(
              //     children: [
              //       Container(
              //         margin:
              //             EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              //         decoration: BoxDecoration(
              //             border: Border.all(
              //                 color: Theme.of(context).primaryColorLight,
              //                 width: 2)),
              //         child: Text(
              //           '\$${transactions[index].amount.toStringAsFixed(2)}',
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 20,
              //               color: Theme.of(context).primaryColor),
              //         ),
              //         padding: EdgeInsets.all(10),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             transactions[index].title,
              //             style: Theme.of(context).textTheme.headline6,
              //           ),
              //           Text(
              //               DateFormat.yMMMMd()
              //                   .format(transactions[index].date),
              //               style: TextStyle(color: Colors.grey))
              //         ],
              //       ),
              // IconButton(onPressed: () {}, icon: Icon(Icons.delete,color: Theme.of(context).errorColor,))
              //     ],
              //   ),
              // );

              return ListTile(
                leading: CircleAvatar(
                  radius: 50,
                  child:
                      Text('${transactions[index].amount.toStringAsFixed(2)}'),
                ),
                title: Text(transactions[index].title,
                    style: Theme.of(context).textTheme.headline6),
                subtitle: Text(
                    DateFormat.yMMMMd().format(transactions[index].date),
                    style: TextStyle(color: Colors.grey)),
                trailing: IconButton(
                    onPressed: () {
                      deletetrasaction(transactions[index].id);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                    )),
              );
            },
            itemCount: transactions.length,
          );
  }
}
