class FirstNameValidator {
  static bool isCorrectFirstName(String firstName) {
    if (firstName.isEmpty) {
      return false;
    }
    //TODO: implement checks that is alpha by RegularExpression (Russian and English letter)
    return true;
  }
}
