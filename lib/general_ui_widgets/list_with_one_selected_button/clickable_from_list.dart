import 'package:flutter/material.dart';

import '../../styling.dart';

class ClikableButtonFromList extends StatefulWidget {
  const ClikableButtonFromList({
    Key? key,
    required this.isFaded,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final bool isFaded;
  final String text;
  final VoidCallback onPressed;
  // final int numberOfButtonInList;

  @override
  State<ClikableButtonFromList> createState() => _ClikableButtonFromListState();
}

class _ClikableButtonFromListState extends State<ClikableButtonFromList> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide(
              color: widget.isFaded == false
                  ? Colors.black
                  : StylingFontsColors.fadedColor,
              width: 1),
          backgroundColor: Colors.white,
          //  wider as possible
          minimumSize: const Size(double.infinity, 49),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
              fontFamily: kMainFont,
              fontSize: kButtonTextFontSize,
              fontWeight: FontWeight.w400,
              color: widget.isFaded == false
                  ? Colors.black
                  : StylingFontsColors.fadedColor),
        ));
  }
}
