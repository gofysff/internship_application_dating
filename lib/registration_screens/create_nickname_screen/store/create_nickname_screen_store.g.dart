// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_nickname_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateNicknameScreenStore on _CreateNicknameStoreBase, Store {
  Computed<bool>? _$isCorrectNicknameComputed;

  @override
  bool get isCorrectNickname => (_$isCorrectNicknameComputed ??= Computed<bool>(
          () => super.isCorrectNickname,
          name: '_CreateNicknameStoreBase.isCorrectNickname'))
      .value;

  @override
  String toString() {
    return '''
isCorrectNickname: ${isCorrectNickname}
    ''';
  }
}
