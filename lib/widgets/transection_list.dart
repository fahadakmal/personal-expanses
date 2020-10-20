import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transection.dart';
import './transection_item.dart';

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
                    const SizedBox(
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
            : ListView(
                children: transections
                    .map((tx) =>
                  TransectionItem(
                      key: ValueKey(tx.id),
                      transection: tx,
                      deleteTransection: deleteTransection)
                ).toList(),
              ));
  }
}
