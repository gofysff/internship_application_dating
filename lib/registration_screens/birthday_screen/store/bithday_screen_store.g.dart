// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bithday_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BirthdayScreenStore on _BirthdayScreenStoreBase, Store {
  Computed<bool>? _$isFadedButtonToNextScreenComputed;

  @override
  bool get isFadedButtonToNextScreen => (_$isFadedButtonToNextScreenComputed ??=
          Computed<bool>(() => super.isFadedButtonToNextScreen,
              name: '_BirthdayScreenStoreBase.isFadedButtonToNextScreen'))
      .value;
  Computed<bool>? _$isCorrectDateComputed;

  @override
  bool get isCorrectDate =>
      (_$isCorrectDateComputed ??= Computed<bool>(() => super.isCorrectDate,
              name: '_BirthdayScreenStoreBase.isCorrectDate'))
          .value;

  @override
  String toString() {
    return '''
isFadedButtonToNextScreen: ${isFadedButtonToNextScreen},
isCorrectDate: ${isCorrectDate}
    ''';
  }
}