
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/widgets/adaptiveButton.dart';

class NewTranscetion extends StatefulWidget {
  final Function addTx;

  NewTranscetion(this.addTx){
    print('Constructor NewTransection  Widget');
  }

  @override
  _NewTranscetionState createState() {
    print('Create State NewTransection  Widget');
    return _NewTranscetionState();
  }
}

class _NewTranscetionState extends State<NewTranscetion> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime _selectDate;

  _NewTranscetionState()
  {
     print('construcote new transection state');
  }

  @override
  void initState() {
    print('initState');
    super.initState();
  }


  @override
  void didUpdateWidget(covariant NewTranscetion oldWidget) {
    print('did update widget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }
  void submitData() {
    if (amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectDate == null) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount, _selectDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[

              TextField(
                controller: titleController,
                onSubmitted: (_) => submitData(),

                //   onChanged: (val) {
                //   titleInput=val;
                // },
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData,
                // onChanged: (val){
                //   amountInput=val;
                // },
                decoration: InputDecoration(labelText: 'Amount'),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(_selectDate == null
                            ? 'No Date Choses'
                            : DateFormat.yMd().format(_selectDate)),),
                        AdaptiveFlatButton('Choose Date', _presentDatePicker)
                  ],
                ),
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                onPressed: submitData,
                child: Text('Add Transection'),
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
