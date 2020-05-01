import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        child: Icon(
          Icons.brightness_2,
          color: Colors.blueAccent,
          size: 45.0,
          semanticLabel: 'Moon icon.',
        ),
        margin: EdgeInsets.symmetric(vertical: 15.0),
        alignment: Alignment.center,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30),
          margin: EdgeInsets.only(bottom: 20),
          child: Text(
            'Get to know your baby`s sleep patterns and keep track of how much sleep they are getting here',
            style: TextStyle(fontSize: 14, height: 1.5),
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
        ),
      )
    ]);
  }
}
