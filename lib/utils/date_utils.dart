import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String shortString() {
    return DateFormat('MMM dd, yyyy').format(this);
  }

  String shortWeekString() {
    return DateFormat('EEE').format(this);
  }

  String shortMonthString() {
    return DateFormat('MMM').format(this);
  }
}
