class NicknameValidator {
  static final validCharacters = RegExp(r'^[a-zA-Z0-9_]+$');

  static bool isCorrectNickname(String nickname) {
    if (nickname.length < 5 || nickname.length > 20) {
      return false;
    }
    return validCharacters.hasMatch(nickname);
  }
}
