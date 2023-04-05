// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ask_user_button_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AskUserButtonStore on AskUserButtonBase, Store {
  late final _$isPressedAtom =
      Atom(name: 'AskUserButtonBase.isPressed', context: context);

  @override
  bool get isPressed {
    _$isPressedAtom.reportRead();
    return super.isPressed;
  }

  @override
  set isPressed(bool value) {
    _$isPressedAtom.reportWrite(value, super.isPressed, () {
      super.isPressed = value;
    });
  }

  late final _$AskUserButtonBaseActionController =
      ActionController(name: 'AskUserButtonBase', context: context);

  @override
  void changeIsPressed() {
    final _$actionInfo = _$AskUserButtonBaseActionController.startAction(
        name: 'AskUserButtonBase.changeIsPressed');
    try {
      return super.changeIsPressed();
    } finally {
      _$AskUserButtonBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPressed: ${isPressed}
    ''';
  }
}
