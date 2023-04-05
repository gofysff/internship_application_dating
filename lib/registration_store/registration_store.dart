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
  String countryNumber = "+7";

  @computed
  String get fullPhoneNumber => countryNumber + phoneNumber;

  @observable
  int otpCode = -1; // TODO: make it nullable

  @observable
  String firstName = "";

  @observable
  String birthday = "";

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

// TODO: 