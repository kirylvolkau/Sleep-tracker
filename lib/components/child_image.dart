import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChildImage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.all(20),
        height: 170,
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('images/child.png')),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: Colors.white));
  }
}