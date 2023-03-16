import 'package:intl/intl.dart';

/// UTIL CLASS
class Utils {
  /// CONVERT TIME FORMAT
  static String convertTimeFormat(String timeString) {
    DateTime dateTime = DateTime.parse(timeString);
    DateFormat formatter = DateFormat('dd-MMM-yy hh:mm a');
    String formatted = formatter.format(dateTime);
    return formatted;
  }
}
