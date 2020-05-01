import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rb_app/screens/home_screen.dart';
import 'models/record.dart';

List<Record> records = List<Record>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.blueAccent,
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            textTheme: TextTheme(
                body1: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ))),
        home: HomeScreen(records));
  }
}
