import 'package:internship_app/registration_store/registration_store.dart';
import 'package:mobx/mobx.dart';

part 'create_nickname_screen_store.g.dart';

// ignore: library_private_types_in_public_api
class CreateNicknameScreenStore = _CreateNicknameStoreBase
    with _$CreateNicknameStore;

abstract class _CreateNicknameStoreBase with Store {
  final RegistrationStore _registrationStore =
      RegistrationStoreSingletone.instanceOfStore;

  final validCharacters = RegExp(r'^[a-zA-Z0-9_]+$');

  @computed
  bool get isCorrectNickname {
    if (_registrationStore.nickname.length < 5) {
      // print('nickname is too short');
      return false;
    }
    // print('len is ok');
    // print(
    //     'nickname is ${_registrationStore.nickname} wih length ${_registrationStore.nickname.length}');
    return validCharacters.hasMatch(_registrationStore.nickname);
  }

  @computed
  bool get isFadedButtonToNextScreen => !isCorrectNickname;
}
