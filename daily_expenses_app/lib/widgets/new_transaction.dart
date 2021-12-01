import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function submithandler;

  NewTransaction(this.submithandler);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titlecontroller = TextEditingController();
  final _amountcontroller = TextEditingController();
  DateTime _selecteddate;

  void _submitdata() {
    final enteredtitle = _titlecontroller.text;
    final enteredamount = double.parse(_amountcontroller.text);
    if (enteredtitle.isEmpty || enteredamount <= 0||_selecteddate==null) {
      return;
    }

    widget.submithandler(enteredtitle, enteredamount,_selecteddate);
    Navigator.of(context).pop();
  }

  void _presentdatepicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2018),
            lastDate: DateTime.now())
        .then((value) {
      print(value);
      if (value == null) {
        return;
      }
      setState(() {
        _selecteddate = value;
      });
    }).catchError((err) {
      print(err);
    });
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
                onSubmitted: (_) => _submitdata(),
                controller: _titlecontroller,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                // onChanged: (value) {
                //   amountinput = value;
                // },
                onSubmitted: (_) => _submitdata(),

                controller: _amountcontroller,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(_selecteddate == null
                          ? 'No date chosen!'
                          : DateFormat.yMd().format(_selecteddate)),
                    ),
                    FlatButton(
                        textColor: Theme.of(context).primaryColor,
                        onPressed: _presentdatepicker,
                        child: Text(
                          'Choose date!',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              FlatButton(
                onPressed: _submitdata,
                child: Text('Add Transaction'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
              )
            ],
          ),
        ));
  }
}
