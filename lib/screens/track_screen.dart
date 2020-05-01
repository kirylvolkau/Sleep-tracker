import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rb_app/components/bottom_picker.dart';
import 'package:rb_app/components/child_image.dart';
import 'package:intl/intl.dart';
import 'package:rb_app/models/record.dart';
import 'package:rb_app/models/sleep_type.dart';
import 'package:rb_app/screens/home_screen.dart';

class TrackPage extends StatefulWidget {
  final List<Record> records;
  TrackPage(this.records);
  State createState() => TrackPageState(this.records);
}

class TrackPageState extends State<TrackPage> {
  List<Record> records;
  String dropdownValue = 'Nap';
  DateTime dateTime = DateTime.now();
  Duration duration = Duration();
  SleepType sleepType ;
  
  TrackPageState(this.records);

  bool _isReady() {
    if (duration.inMilliseconds == 0 || sleepType == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sleep tracker"),
        ),
        body: Column(children: <Widget>[
          ChildImage(),
          Container(
              margin: EdgeInsets.only(bottom: 10, left: 30, right: 30),
              padding: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 1.0, color: Colors.grey.shade400))),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Icon(
                      Icons.calendar_today,
                      color: Colors.blueAccent,
                      size: 32.0,
                      semanticLabel: 'Calendar icon.',
                    ),
                  ),
                  Container(
                    width: 5,
                  ),
                  Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Date and time',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0),
                          ),
                          Text(
                            DateFormat('d MMMM y, H:m').format(dateTime),
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ))
                ],
              )),
          FlatButton(
              onPressed: _showSleepTypeAlertDialog,
              child: Container(
                  margin:
                      EdgeInsets.only(top: 5, bottom: 10, left: 15, right: 15),
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1.0, color: Colors.grey.shade400))),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Icon(
                          Icons.brightness_3,
                          color: Colors.blueAccent,
                          size: 32.0,
                          semanticLabel: 'Moon icon.',
                        ),
                      ),
                      Container(
                        width: 5,
                      ),
                      Expanded(
                          flex: 8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Sleep type',
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              Text(
                                (sleepType==null) ? "Night sleep, nap, etc." : sleepType.lookUp() ,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          ))
                    ],
                  ))),
          FlatButton(
              onPressed: _showDurationPicker,
              child: Container(
                  margin:
                      EdgeInsets.only(top: 5, bottom: 20, left: 15, right: 15),
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1.0, color: Colors.grey.shade400))),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: new Icon(
                          Icons.av_timer,
                          color: Colors.blueAccent,
                          size: 38.0,
                          semanticLabel: 'Timer icon.',
                        ),
                      ),
                      Container(
                        width: 5,
                      ),
                      Expanded(
                          flex: 8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Duration',
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              Text(
                                (duration.inMilliseconds != 0)
                                    ? "${duration.inHours} hours ${duration.inMinutes % 60} minutes"
                                    : '-',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          ))
                    ],
                  ))),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              width: MediaQuery.of(context).size.width - 50,
              child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.blueAccent.shade200,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black45,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                  ),
                  padding: EdgeInsets.all(20.0),
                  splashColor: Colors.blueAccent.shade400,
                  onPressed: _isReady()
                      ? () {
                          records.add(Record(this.dateTime, this.duration, this.sleepType));
                          Navigator.pop(context);
                        }
                      : null,
                  child: Text(
                    "Save",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  )))
        ]));
  }

  void _showDurationPicker() {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return BottomPicker(
          CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.hm,
            initialTimerDuration: duration,
            onTimerDurationChanged: (Duration newDuration) {
              if (mounted) {
                setState(() => duration = newDuration);
              }
            },
          ),
        );
      },
    );
  }

  void _showSleepTypeAlertDialog(){
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {

          return AlertDialog(
            content: StatefulBuilder(
              builder:
                  ( context, setState) {
                return Container(
                    height: 150,
                    width: 150,
                    padding: EdgeInsets.only(top: 15),
                    alignment: Alignment.center,
                    child : Column(
                      children: <Widget>[
                        ListTile(
                          title: const Text("Nap"),
                          leading: Radio(
                            value: SleepType.nap,
                            groupValue: sleepType,
                            onChanged: (SleepType value) {
                              setState(() { this.setState(() =>sleepType = value ); });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Night`s sleep'),
                          leading: Radio(
                            value: SleepType.night,
                            groupValue: sleepType,
                            onChanged: (SleepType value) {
                              setState(() {
                                this.setState(() =>sleepType = value )
                                 ;});
                            },
                          ),
                        ),
                      ],
                    ));
              },
            ),
          );
        });
  }
}
