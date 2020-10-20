import 'package:flutter/foundation.dart';

class Transection {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transection(
      {
        @required this.id,
      @required this.title,
      @required this.amount,
      @required this.date
      }
      );
}
