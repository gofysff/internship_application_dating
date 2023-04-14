// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ValidationStore on _ValidationStoreBase, Store {
  Computed<bool>? _$isCorrectNicknameComputed;

  @override
  bool get isCorrectNickname => (_$isCorrectNicknameComputed ??= Computed<bool>(
          () => super.isCorrectNickname,
          name: '_ValidationStoreBase.isCorrectNickname'))
      .value;
  Computed<bool>? _$isCorrectFirstNameComputed;

  @override
  bool get isCorrectFirstName => (_$isCorrectFirstNameComputed ??=
          Computed<bool>(() => super.isCorrectFirstName,
              name: '_ValidationStoreBase.isCorrectFirstName'))
      .value;
  Computed<bool>? _$isCorrectBirthdayComputed;

  @override
  bool get isCorrectBirthday => (_$isCorrectBirthdayComputed ??= Computed<bool>(
          () => super.isCorrectBirthday,
          name: '_ValidationStoreBase.isCorrectBirthday'))
      .value;
  Computed<bool>? _$isCorrectPhoneNumberComputed;

  @override
  bool get isCorrectPhoneNumber => (_$isCorrectPhoneNumberComputed ??=
          Computed<bool>(() => super.isCorrectPhoneNumber,
              name: '_ValidationStoreBase.isCorrectPhoneNumber'))
      .value;

  @override
  String toString() {
    return '''
isCorrectNickname: ${isCorrectNickname},
isCorrectFirstName: ${isCorrectFirstName},
isCorrectBirthday: ${isCorrectBirthday},
isCorrectPhoneNumber: ${isCorrectPhoneNumber}
    ''';
  }
}
