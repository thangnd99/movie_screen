class Util {
  Util._();

  static DateTime parseStringToDateTime(String source) {
    DateTime _dateTime = DateTime.parse(source);
    return _dateTime;
  }
}
