import 'package:flutter/material.dart';
import 'package:rb_app/models/record.dart';

class RecordItem extends StatelessWidget {
  final Record record;
  final last, first;

  RecordItem(this.record, this.first, this.last);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 0),
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        border: Border(
          bottom: (this.last) ? BorderSide.none : BorderSide(color: Colors.grey.shade50, width: 1.0)
        )
      ),
      child: Card(
        margin: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular((this.first) ? 15.0 : 0.0),
                topRight: Radius.circular((this.first) ? 15.0 : 0.0),
                bottomLeft: Radius.circular((this.last) ? 15.0 : 0.0),
                bottomRight: Radius.circular((this.last) ? 15.0 : 0.0)),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 247, 246, 243),
                          borderRadius: BorderRadius.only(
                              topLeft:
                              Radius.circular((this.first) ? 15.0 : 0.0),
                              topRight: Radius.circular(0.0),
                              bottomLeft:
                              Radius.circular((this.last) ? 15.0 : 0.0),
                              bottomRight: Radius.circular(0.0))),
                      alignment: Alignment.center,
                      child: Text(
                        record.sleepTime,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ))),
              Expanded(
                  flex: 8,
                  child: Container(
                    padding: EdgeInsets.only(left: 8.0),
                    height: 80,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(record.recordType,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueAccent.shade200,
                                  fontWeight: FontWeight.bold)),
                          Container(height: 5),
                          Text(
                            record.sleepDuration,
                            style: TextStyle(fontSize: 14),
                          ),
                        ]),
                    //alignment: Alignment.center,
                  )),
            ],
          )),
    );
  }
}