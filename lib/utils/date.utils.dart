import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(DateTime dateTime, String format) {
    return DateFormat(format).format(dateTime);
  }

  static String formatDateLong(DateTime dateTime) {
    return DateFormat('EEEE, dd MMMM yyyy').format(dateTime);
  }

  static String formatDateShort(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  static String formatDateTime(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
  }
}
