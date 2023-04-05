import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'clickable_from_list.dart';
import 'list_with_one_selected_button_storage/list_with_one_selected_button_store.dart';

final ListWithOneSelectedButtonStore _listWithOneSelectedButtonStore =
    ListWithOneSelectedButtonStore();

class ListWithOneSelectedButton extends StatefulWidget {
  const ListWithOneSelectedButton({
    Key? key,
    this.indexSelected = 0,
    required this.buttonsTextValues,
  }) : super(key: key);

  final int indexSelected;
  final List<String> buttonsTextValues;
  @override
  State<ListWithOneSelectedButton> createState() =>
      _ListWithOneSelectedButtonState();

  /// method that returns selected button value
  String get getSelectedButtonValue =>
      buttonsTextValues[_listWithOneSelectedButtonStore.selectedButtonIndex];
}

class _ListWithOneSelectedButtonState extends State<ListWithOneSelectedButton> {
  static const double distanceBeetweenButtons = 20;
  late int indexSelected =
      widget.indexSelected; //? check if it's get when build

  // late List<String> widgetButtons = widget.buttonsTextValues;

  Observer get getButtonsFromTextConfigurationWithSpaces {
    return Observer(builder: (_) {
      List<Widget> buttonsWithSpaces = [];
      if (widget.buttonsTextValues.isNotEmpty) {
        // first element
        buttonsWithSpaces.add(ClikableButtonFromList(
          isFaded: _listWithOneSelectedButtonStore.selectedButtonIndex != 0,
          text: widget.buttonsTextValues[0],
          onPressed: () {
            _listWithOneSelectedButtonStore.changeSelectedButtonIndex(0);
            setState(() {});
          },
        ));
      }

      if (widget.buttonsTextValues.length >= 2) {
        // all other elements
        for (var i = 1; i < widget.buttonsTextValues.length; i++) {
          buttonsWithSpaces
              .add(const SizedBox(height: distanceBeetweenButtons));
          buttonsWithSpaces.add(ClikableButtonFromList(
              isFaded: i != _listWithOneSelectedButtonStore.selectedButtonIndex,
              text: widget.buttonsTextValues[i],
              onPressed: () {
                _listWithOneSelectedButtonStore.changeSelectedButtonIndex(i);
                setState(() {});
              }));
        }
      }
      return Column(children: buttonsWithSpaces);
    });
  }

  // TODO: ask how this is awful
  @override
  Widget build(BuildContext context)
  // return Column with buttons what is separated SizedBox with distanceBeetweenButtons
  {
    return getButtonsFromTextConfigurationWithSpaces;
  }
}
