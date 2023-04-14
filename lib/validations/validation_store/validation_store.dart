import 'package:internship_app/registration_store/registration_store.dart';
import 'package:mobx/mobx.dart';

import '../validators/bithday_validator.dart';
import '../validators/first_name_validator.dart';
import '../validators/nickname_validator.dart';
import '../validators/phone_number_validator.dart';
part 'validation_store.g.dart';

class ValidationStore = _ValidationStoreBase with _$ValidationStore;

abstract class _ValidationStoreBase with Store {
  final RegistrationStore _registrationStore =
      RegistrationStoreSingletone.instanceOfStore;

  @computed
  bool get isCorrectNickname =>
      NicknameValidator.isCorrectNickname(_registrationStore.nickname);

  @computed
  bool get isCorrectFirstName =>
      FirstNameValidator.isCorrectFirstName(_registrationStore.firstName);

  @computed
  bool get isCorrectBirthday =>
      BirthdayValidator.isCorrectDate(_registrationStore.birthdayDate);

  @computed
  bool get isCorrectPhoneNumber =>
      PhoneNumberValidator.isPhoneNumberCorrect(_registrationStore.phoneNumber);
}
