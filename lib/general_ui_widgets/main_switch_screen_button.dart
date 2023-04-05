import 'package:flutter/material.dart';
import '../styling.dart';

/// This button is used in all screens
/// usually for switching to the next screen
class MainSwitchScreenButton extends StatelessWidget {
  const MainSwitchScreenButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.isFaded = false});

  final bool isFaded;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // foregroundColor:
        //     isFaded == false ? kMainButtonTextColor : const Color(0xffEAEAEA),
        backgroundColor:
            isFaded == false ? kMainButtonsColor : const Color(0xffEAEAEA),
        //  wider as possible
        minimumSize: const Size(double.infinity, 49),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      child: Text(text,
          style: TextStyle(
              fontFamily: kMainFont,
              fontSize: kButtonTextFontSize,
              fontWeight: FontWeight.w400,
              color: isFaded == false
                  ? kMainButtonSwitchTextColor
                  : const Color(0xffA4A4A4))),
    );
  }
}
