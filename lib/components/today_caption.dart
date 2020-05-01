import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TodayCaption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 25.0),
      margin: EdgeInsets.only(left: 25.0, top: 80),
      child: Text(
          new DateFormat("EEEE, d MMM y", "en_US")
              .format(DateTime.now())
              .toUpperCase(),
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
    );
  }
}
