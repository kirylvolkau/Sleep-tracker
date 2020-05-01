import 'sleep_type.dart';
import 'package:intl/intl.dart';

class Record {
  final DateTime time;
  final Duration duration;
  final SleepType sleepType;

  Record(this.time, this.duration, this.sleepType);

  String get sleepTime {
    return new DateFormat.Hm().format(time);
  }

  String get sleepDuration {
    return "${duration.inHours} hours ${duration.inMinutes%60} minutes";
  }

  String get recordType {
    return sleepType == SleepType.nap ? "Nap" : "Night's sleep";
  }
}