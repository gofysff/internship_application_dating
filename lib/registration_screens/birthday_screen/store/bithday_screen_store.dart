import 'package:internship_app/registration_store/registration_store.dart';
import 'package:mobx/mobx.dart';
import '../res.dart';
import 'package:intl/intl.dart';

part 'bithday_screen_store.g.dart';

// ignore: library_private_types_in_public_api
class BirthdayScreenStore = _BirthdayScreenStoreBase with _$BirthdayScreenStore;

abstract class _BirthdayScreenStoreBase with Store {
  final RegistrationStore _registrationStore =
      RegistrationStoreSingletone.instanceOfStore;

  @computed
  bool get isCorrectDate =>
      _registrationStore.birthdayDate.length ==
          BirthdayScreenRes.dateFormat.length &&
      _isDate(_registrationStore.birthdayDate, BirthdayScreenRes.dateFormat);

  bool _isDate(String input, String format) {
    try {
      DateFormat(format).parseStrict(input);

      return true;
    } catch (e) {
      //print(e);
      return false;
    }
  }
}
