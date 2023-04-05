// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_with_one_selected_button_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListWithOneSelectedButtonStore on ListWithOneSelectedButtonBase, Store {
  late final _$selectedButtonIndexAtom = Atom(
      name: 'ListWithOneSelectedButtonBase.selectedButtonIndex',
      context: context);

  @override
  int get selectedButtonIndex {
    _$selectedButtonIndexAtom.reportRead();
    return super.selectedButtonIndex;
  }

  @override
  set selectedButtonIndex(int value) {
    _$selectedButtonIndexAtom.reportWrite(value, super.selectedButtonIndex, () {
      super.selectedButtonIndex = value;
    });
  }

  late final _$ListWithOneSelectedButtonBaseActionController =
      ActionController(name: 'ListWithOneSelectedButtonBase', context: context);

  @override
  void changeSelectedButtonIndex(int index) {
    final _$actionInfo =
        _$ListWithOneSelectedButtonBaseActionController.startAction(
            name: 'ListWithOneSelectedButtonBase.changeSelectedButtonIndex');
    try {
      return super.changeSelectedButtonIndex(index);
    } finally {
      _$ListWithOneSelectedButtonBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedButtonIndex: ${selectedButtonIndex}
    ''';
  }
}
