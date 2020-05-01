enum SleepType {
  night, nap
}

extension ParseToString on SleepType {
  String lookUp() {
    if(this == SleepType.night){
      return "Night's sleep";
    }
    if(this == SleepType.nap){
      return "Nap";
    }
  }
}