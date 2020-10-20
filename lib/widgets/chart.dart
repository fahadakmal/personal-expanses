import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transection.dart';
import 'package:personal_expenses/widgets/chart_bar.dart';
import '../models/transection.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transection> recentTransection;

  Chart(this.recentTransection);

  List<Map<String, Object>> get groupedTransectionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < recentTransection.length; i++) {
        if (recentTransection[i].date.day == weekDay.day &&
            recentTransection[i].date.month == weekDay.month &&
            recentTransection[i].date.year == weekDay.year) {
          totalSum += recentTransection[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(totalSum);
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedTransectionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransectionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransectionValues.map((data) {
            return Flexible(
              fit:FlexFit.tight,
              child: ChartBar(data['day'], data['amount'],
                 maxSpending== 0.0 ? 0.0 : (data['amount'] as double) / maxSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
