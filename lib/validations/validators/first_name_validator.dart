class FirstNameValidator {
  static bool isCorrectFirstName(String firstName) {
    if (firstName.isEmpty) {
      return false;
    }
    final validCharacters = RegExp(r'^[a-zA-Zа-яА-Я]+$');
    return validCharacters.hasMatch(firstName);
  }
}
