import 'package:flutter/material.dart';
import 'package:rb_app/components/home_intro.dart';
import 'package:rb_app/components/record_list.dart';
import 'package:rb_app/components/today_caption.dart';
import 'package:rb_app/models/record.dart';
import 'package:rb_app/screens/track_screen.dart';


class HomeScreen extends StatefulWidget
{
  final List<Record> records;
  HomeScreen(this.records);
  State createState() => HomeScreenState(this.records);
}


class HomeScreenState extends State<HomeScreen> {
  List<Record> records;
  HomeScreenState(this.records);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
          const SliverAppBar(
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Sleep tracking'),
              )),
          SliverList(
            delegate: SliverChildListDelegate([
              HomeIntro(),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: FlatButton(
                    textColor: Colors.white,
                    color: Colors.blueAccent.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                    padding: EdgeInsets.all(20.0),
                    splashColor: Colors.blueAccent.shade400,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TrackPage(this.records)));
                      },
                    child: Text(
                      "Add new sleeping record",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  )),
              TodayCaption()
            ]),
          ),
          RecordList(records),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 20,
                )
              ],
            ),
          )
        ]));
  }
}