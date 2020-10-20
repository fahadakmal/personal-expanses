import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transection.dart';
import 'package:intl/intl.dart';

class TransectionList extends StatelessWidget {
  final List<Transection> transections;
  final Function deleteTransection;

  TransectionList(this.transections, this.deleteTransection);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: transections.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No Transection added yet',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ))
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text('\$${transections[index].amount}')),
                      ),
                    ),
                    title: Text(transections[index].title,
                        style: Theme.of(context).textTheme.title),
                    subtitle:
                        Text(DateFormat.yMd().format(transections[index].date)),
                    trailing: MediaQuery.of(context).size.width > 460
                        ? FlatButton.icon(
                      onPressed: () {
                        deleteTransection(transections[index].id);
                      },                            icon: Icon(Icons.delete),
                            label: Text('Delete'),
                            textColor: Theme.of(context).errorColor,
                          )
                        : IconButton(
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () {
                              deleteTransection(transections[index].id);
                            },
                          ),
                  ),
                );
              },
              itemCount: transections.length,
            ),
    );
  }
}
