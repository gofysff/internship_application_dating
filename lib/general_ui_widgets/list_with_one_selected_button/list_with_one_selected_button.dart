import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internship_app/general_ui_widgets/list_with_one_selected_button/store/list_with_one_selected_button_store.dart';

import 'clickable_from_list.dart';

class ListWithOneSelectedButton extends StatefulWidget {
  ListWithOneSelectedButton({
    Key? key,
    this.indexSelected = 0,
    required this.buttonsTextValues,
  }) : super(key: key);

  final int indexSelected;
  final List<String> buttonsTextValues;
  final ListWithOneSelectedButtonStore _listWithOneSelectedButtonStore =
      ListWithOneSelectedButtonStore();

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

  Observer get getButtonsFromTextConfigurationWithSpaces {
    return Observer(builder: (_) {
      List<Widget> buttonsWithSpaces = [];
      if (widget.buttonsTextValues.isNotEmpty) {
        // first element of list
        // if it's only one element in list, it will be added in any case and we will not add unnecessary SizedBox
        buttonsWithSpaces.add(
          ClikableButtonFromList(
            isFaded:
                widget._listWithOneSelectedButtonStore.selectedButtonIndex != 0,
            text: widget.buttonsTextValues[0],
            onPressed: () {
              widget._listWithOneSelectedButtonStore
                  .changeSelectedButtonIndex(0);
              setState(() {});
            },
          ),
        );
      }

      if (widget.buttonsTextValues.length >= 2) {
        // all other elements
        for (var i = 1; i < widget.buttonsTextValues.length; i++) {
          buttonsWithSpaces.add(
            const SizedBox(height: distanceBeetweenButtons),
          );
          buttonsWithSpaces.add(
            ClikableButtonFromList(
              isFaded: i !=
                  widget._listWithOneSelectedButtonStore.selectedButtonIndex,
              text: widget.buttonsTextValues[i],
              onPressed: () {
                widget._listWithOneSelectedButtonStore
                    .changeSelectedButtonIndex(i);
                setState(() {});
              },
            ),
          );
        }
      }
      return Column(children: buttonsWithSpaces);
    });
  }

  @override
  Widget build(BuildContext context)
  // return Column with buttons what is separated SizedBox with distanceBeetweenButtons
  {
    return getButtonsFromTextConfigurationWithSpaces;
  }
}
