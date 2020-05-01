import 'package:flutter/material.dart';
import 'record_list_item.dart';
import 'package:rb_app/models/record.dart';

class RecordList extends StatefulWidget
{
  final List<Record> records;
  RecordList(this.records);
  State createState() => RecordListState(this.records);
}

class RecordListState extends State<RecordList>
{
  final List<Record> records;
  RecordListState(this.records);
  @override
  Widget build(BuildContext context) {
    return SliverPadding(padding: EdgeInsets.all(0), sliver:SliverList(
      delegate: SliverChildListDelegate(_buildRecordItems(this.records)),
    ) )
     ;
  }

  List<RecordItem> _buildRecordItems(List<Record> records) {
    List<RecordItem> list = new List<RecordItem>();
    if (records.isEmpty) {
      return list;
    }
    if (records.length == 1) {
      list.add(RecordItem(records[0], true, true));
      return list;
    } else {
      list.add(RecordItem(records[records.length - 1], true, false));
    }
    for (int i = records.length - 2; i > 0; i--) {
      list.add(RecordItem(records[i], false, false));
    }
    list.add(RecordItem(records[0], false, true));
    return list;
  }
}



