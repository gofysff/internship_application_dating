import 'package:internship_app/registration_store/registration_store.dart';
import 'package:mobx/mobx.dart';

import '../../../validations/validators/bithday_validator.dart';

part 'bithday_screen_store.g.dart';

// ignore: library_private_types_in_public_api
class BirthdayScreenStore = _BirthdayScreenStoreBase with _$BirthdayScreenStore;

abstract class _BirthdayScreenStoreBase with Store {
  final RegistrationStore _registrationStore =
      RegistrationStoreSingletone.instanceOfStore;

  @computed
  bool get isCorrectDate =>
      BirthdayValidator.isCorrectDate(_registrationStore.birthdayDate);
}
