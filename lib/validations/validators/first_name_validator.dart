import 'is_valid_interface.dart';

class FirstNameValidator implements IsValidInterface {
  @override
  bool isValid(String firstName) {
    if (firstName.isEmpty) {
      return false;
    }
    final validCharacters = RegExp(r'^[a-zA-Zа-яА-Я]+$');
    return validCharacters.hasMatch(firstName);
  }
}
