import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

import 'to_json_interface.dart';

part 'registration_store.g.dart';

class RegistrationStoreSingletone {
  static final RegistrationStore _instance = RegistrationStore();
  static RegistrationStore get instanceOfStore => _instance;
}

@JsonSerializable()
class RegistrationStore extends RegistrationStoreBase
    with _$RegistrationStore
    implements ToJsonInterface {
  @override
  Map<String, dynamic> toJson() => _$RegistrationStoreToJson(this);
}

abstract class RegistrationStoreBase with Store {
  @observable
  String phoneNumber = "";

  @observable
  String countryNumber = "+7";

  @computed
  String get fullPhoneNumber => '$countryNumber-$phoneNumber';

  @JsonKey(includeToJson: false)
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
