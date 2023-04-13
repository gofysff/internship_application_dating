// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bithday_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BirthdayScreenStore on _BirthdayScreenStoreBase, Store {
  Computed<bool>? _$isCorrectDateComputed;

  @override
  bool get isCorrectDate =>
      (_$isCorrectDateComputed ??= Computed<bool>(() => super.isCorrectDate,
              name: '_BirthdayScreenStoreBase.isCorrectDate'))
          .value;

  late final _$isFadedButtonToNextScreenAtom = Atom(
      name: '_BirthdayScreenStoreBase.isFadedButtonToNextScreen',
      context: context);

  @override
  bool get isFadedButtonToNextScreen {
    _$isFadedButtonToNextScreenAtom.reportRead();
    return super.isFadedButtonToNextScreen;
  }

  @override
  set isFadedButtonToNextScreen(bool value) {
    _$isFadedButtonToNextScreenAtom
        .reportWrite(value, super.isFadedButtonToNextScreen, () {
      super.isFadedButtonToNextScreen = value;
    });
  }

  late final _$_BirthdayScreenStoreBaseActionController =
      ActionController(name: '_BirthdayScreenStoreBase', context: context);

  @override
  void setIsFadedisFadedButtonToNextScreen() {
    final _$actionInfo = _$_BirthdayScreenStoreBaseActionController.startAction(
        name: '_BirthdayScreenStoreBase.setIsFadedisFadedButtonToNextScreen');
    try {
      return super.setIsFadedisFadedButtonToNextScreen();
    } finally {
      _$_BirthdayScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFadedButtonToNextScreen: ${isFadedButtonToNextScreen},
isCorrectDate: ${isCorrectDate}
    ''';
  }
}
