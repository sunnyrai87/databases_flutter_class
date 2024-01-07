import 'package:intl/intl.dart';

class DateTimeUtils {
  static final dateFormat = DateFormat.yMd();

  static String getFormattedDateFromMilli(int milliseconds) {
    var date = DateTime.fromMicrosecondsSinceEpoch(milliseconds);

    //var formattedDate = dateFormat.format(date);
    //return formattedDate;
    return getFormattedDateFromDateTime(date);
  }

  static String getFormattedDateFromDateTime(DateTime dateTime) {
    var formattedDate = dateFormat.format(dateTime);

    return formattedDate;
  }
}
