import 'package:intl/intl.dart';

extension StringExtension on String {
  String formatHHmm() {
    final parseDate = DateTime.parse(this).toLocal();
    final newDateFormat = DateFormat('HH:mm').format(parseDate);

    return newDateFormat;
  }

  String formatDay(String? locale) {
    final now = DateTime.now();
    final parseDate = DateTime.parse(this);
    final difference = now.difference(parseDate).inDays;
    final newDateFormat = DateFormat('dd.MM.yyyy', locale).format(parseDate);

    if (difference == 0) {
      return DateFormat('HH:mm', locale).format(parseDate);
    } else if (difference == 1) {
      return 'Yesterday';
    } else if (difference > 1 && difference < 7) {
      return DateFormat('EEEE', locale).format(parseDate);
    } else {
      return newDateFormat;
    }
  }

  String capitalize() {
    if (isEmpty) {
      return this;
    }

    final newString = split(' ')
        .map(
          (word) => word.isNotEmpty
              ? word[0].toUpperCase() + word.substring(1).toLowerCase()
              : '',
        )
        .join(' ');

    return newString;
  }

  String dateFormat() {
    final parseDate = DateTime.parse(this);
    if (parseDate.year == DateTime.now().year) {
      final formattedDate = DateFormat('MMMM dd').format(parseDate);

      return formattedDate;
    }

    final formattedDate = DateFormat('MMMM dd,yyyy').format(parseDate);

    return formattedDate;
  }

  DateTime toDateTime() {
    final parsedDateTime = DateTime.parse(this);

    return parsedDateTime;
  }
}
