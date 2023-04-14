import 'package:internship_app/registration_store/registration_store.dart';
import 'package:mobx/mobx.dart';

import '../../../validations/validators/first_name_validator.dart';
part 'first_name_screen_store.g.dart';

class FirstNameScreenStore = _FirstNameScreenBase with _$FirstNameScreenStore;

abstract class _FirstNameScreenBase with Store {
  final RegistrationStore _registrationStore =
      RegistrationStoreSingletone.instanceOfStore;

  @computed
  bool get isCorrectedData =>
      FirstNameValidator.isCorrectFirstName(_registrationStore.firstName);
  // TODO: replace in one mobX Store
}
