import '../../registration_screens/phone_number_screen/res.dart';

class PhoneNumberValidator {
  // show how should look number
  static const phoneMask = PhoneNumberScreenRes.maskTextField;

  static bool isPhoneNumberCorrect(String phoneNumber) {
    if (PhoneNumberScreenRes.correctPhoneNumberLength != phoneNumber.length) {
      return false;
    }
    String phoneNumberWithoutDelimeter =
        phoneNumber.split(PhoneNumberScreenRes.maskDelimeter).join();

    return int.tryParse(phoneNumberWithoutDelimeter) != null ? true : false;
  }
}

//TODO: test that