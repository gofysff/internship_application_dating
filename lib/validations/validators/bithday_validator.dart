import 'package:intl/intl.dart';

import '../../registration_screens/birthday_screen/res.dart';
import 'is_valid_interface.dart';

class BirthdayValidator implements IsValidInterface {
  @override
  bool isValid(String date) =>
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
