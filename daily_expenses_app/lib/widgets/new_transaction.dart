import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function submithandler;

  NewTransaction(this.submithandler);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();

  void submitdata() {
    final enteredtitle = titlecontroller.text;
    final enteredamount = double.parse(amountcontroller.text);
    if (enteredtitle.isEmpty || enteredamount <= 0) {
      return;
    }

    widget.submithandler(enteredtitle, enteredamount);
    Navigator.of(context).pop();
  }

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
                onSubmitted: (_) => submitdata(),
                controller: titlecontroller,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                // onChanged: (value) {
                //   amountinput = value;
                // },
                onSubmitted: (_) => submitdata(),

                controller: amountcontroller,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
              ),
              FlatButton(
                  onPressed: submitdata,
                  child: Text('Add Transaction'),
                  color: Colors.blue)
            ],
          ),
        ));
  }
}
