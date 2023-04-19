import 'package:internship_app/validations/validators/is_valid_interface.dart';

class NicknameValidator implements IsValidInterface {
  static final validCharacters = RegExp(r'^[a-zA-Z0-9_]+$');

  @override
  bool isValid(String nickname) {
    if (nickname.length < 5 || nickname.length > 20) {
      return false;
    }
    return validCharacters.hasMatch(nickname);
  }
}
