class DateHelper {
  static String fromIsoString(String isoString) {
    var date = DateTime.parse(isoString);
    return "${date.day}-${date.month}-${date.year}";
  }
}
