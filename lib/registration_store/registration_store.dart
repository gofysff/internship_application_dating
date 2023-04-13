import 'package:mobx/mobx.dart';

part 'registration_store.g.dart';

class RegistrationStoreSingletone {
  static final RegistrationStore _instance = RegistrationStore();
  static RegistrationStore get instanceOfStore => _instance;
}

class RegistrationStore = RegistrationStoreBase with _$RegistrationStore;

abstract class RegistrationStoreBase with Store {
  @observable
  String phoneNumber = "";

  @observable
  String countryNumber = "7";

  @computed
  String get fullPhoneNumber => '+$countryNumber-$phoneNumber';

  @observable
  String? otpCode;

  @observable
  String firstName = "";

  @observable
  String birthdayDate = "";

  @observable
  String nickname = "";

  @observable
  String gender = "";

  @observable
  String showYou = "";

  @observable
  bool showEveryoneRealName = true;

  @observable
  bool showGenderOnProfile = true;
}
