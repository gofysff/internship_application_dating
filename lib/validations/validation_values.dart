import 'validators/bithday_validator.dart';
import 'validators/first_name_validator.dart';
import 'validators/nickname_validator.dart';
import 'validators/phone_number_validator.dart';

enum ValidationValues {
  nickname,
  firstName,
  birthday,
  phoneNumber,
}
// Compare this snippet from lib/validations/validation_store/validation_store.dart:

extension ValidateValues on ValidationValues {
  static final nicknameValidator = NicknameValidator();
  static final firstNameValidator = FirstNameValidator();
  static final birthdayValidator = BirthdayValidator();
  static final phoneNumberValidator = PhoneNumberValidator();

  bool isValid(String value) {
    switch (this) {
      case ValidationValues.nickname:
        return nicknameValidator.isValid(value);
      case ValidationValues.firstName:
        return firstNameValidator.isValid(value);
      case ValidationValues.birthday:
        return birthdayValidator.isValid(value);
      case ValidationValues.phoneNumber:
        return phoneNumberValidator.isValid(value);
    }
  }
}
