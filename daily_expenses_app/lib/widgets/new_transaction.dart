import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();

  final Function submithandler;

  NewTransaction(this.submithandler);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                // onChanged: (value) {
                //   titleinput = value;
                // },
                controller: titlecontroller,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                // onChanged: (value) {
                //   amountinput = value;
                // },
                controller: amountcontroller,
                decoration: InputDecoration(labelText: 'Amount'),
              ),
              FlatButton(
                  onPressed: () {
                    submithandler(titlecontroller.text,
                        double.parse(amountcontroller.text));
                  },
                  child: Text('Add Transaction'),
                  color: Colors.blue)
            ],
          ),
        ));
  }
}
