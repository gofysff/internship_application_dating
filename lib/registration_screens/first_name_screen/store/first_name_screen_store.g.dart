// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'first_name_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FirstNameScreenStore on _FirstNameScreenBase, Store {
  Computed<bool>? _$isCorrectedDataComputed;

  @override
  bool get isCorrectedData =>
      (_$isCorrectedDataComputed ??= Computed<bool>(() => super.isCorrectedData,
              name: '_FirstNameScreenBase.isCorrectedData'))
          .value;

  @override
  String toString() {
    return '''
isCorrectedData: ${isCorrectedData}
    ''';
  }
}
