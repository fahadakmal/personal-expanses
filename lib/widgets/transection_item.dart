import 'package:flutter/material.dart';
import '../models/transection.dart';
import 'package:intl/intl.dart';
import 'dart:math';


class TransectionItem extends StatefulWidget {
  const TransectionItem({
    Key key,
    @required this.transection,
    @required this.deleteTransection,
  }) : super(key: key);

  final Transection transection;
  final Function deleteTransection;

  @override
  _TransectionItemState createState() => _TransectionItemState();
}

class _TransectionItemState extends State<TransectionItem> {
    Color _bgColor;
  @override
  void initState() {
    const availableColors=[Colors.red,Colors.black,Colors.green,Color(0xFFB74093)];
    _bgColor=availableColors[Random().nextInt(4)];


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
                child: Text('\$${widget.transection.amount}')),
          ),
        ),
        title: Text(widget.transection.title,
            style: Theme.of(context).textTheme.title),
        subtitle:
        Text(DateFormat.yMd().format(widget.transection.date)),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
          onPressed: () {
            widget.deleteTransection(widget.transection.id);
          },                            icon:const Icon(Icons.delete),
          label:const Text('Delete'),
          textColor: Theme.of(context).errorColor,
        )
            : IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () {
            widget.deleteTransection(widget.transection.id);
          },
        ),
      ),
    );
  }
}