import 'package:internship_app/validations/validators/is_valid_interface.dart';

import '../../registration_screens/phone_number_screen/res.dart';

class PhoneNumberValidator implements IsValidInterface {
  // show how should look number
  static const phoneMask = PhoneNumberScreenRes.maskTextField;

  @override
  bool isValid(String phoneNumber) {
    if (PhoneNumberScreenRes.correctPhoneNumberLength != phoneNumber.length) {
      return false;
    }
    String phoneNumberWithoutDelimeter =
        phoneNumber.split(PhoneNumberScreenRes.maskDelimeter).join();

    return int.tryParse(phoneNumberWithoutDelimeter) != null ? true : false;
  }
}

//TODO: test that