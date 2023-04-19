// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

import 'package:internship_app/registration_store/registration_store.dart';

import '../validation_values.dart';

part 'validation_store.g.dart';

// ignore: library_private_types_in_public_api
class ValidationStore = _ValidationStoreBase with _$ValidationStore;

abstract class _ValidationStoreBase with Store {
  final RegistrationStore _registrationStore;
  _ValidationStoreBase(
    this._registrationStore,
  );

  @computed
  bool get isCorrectNickname =>
      ValidationValues.nickname.isValid(_registrationStore.nickname);

  @computed
  bool get isCorrectFirstName =>
      ValidationValues.firstName.isValid(_registrationStore.firstName);

  @computed
  bool get isCorrectBirthday =>
      ValidationValues.birthday.isValid(_registrationStore.birthdayDate);

  @computed
  bool get isCorrectPhoneNumber =>
      ValidationValues.phoneNumber.isValid(_registrationStore.phoneNumber);
}
