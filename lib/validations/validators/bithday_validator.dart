import 'package:intl/intl.dart';

import '../../registration_screens/birthday_screen/res.dart';

class BirthdayValidator {
  static bool isCorrectDate(String date) =>
      date.length == BirthdayScreenRes.dateFormat.length &&
      _isDate(date, BirthdayScreenRes.dateFormat);

  static bool _isDate(String input, String format) {
    try {
      DateFormat(format).parseStrict(input);
      return true;
    } catch (e) {
      //print(e);
      return false;
    }
  }
}
