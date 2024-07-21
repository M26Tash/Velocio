import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String formatWithoutTime() {
    final newFormat = DateFormat('dd-MM-yyyy');
    final newDate = newFormat.format(this);

    return newDate;
  }
}
