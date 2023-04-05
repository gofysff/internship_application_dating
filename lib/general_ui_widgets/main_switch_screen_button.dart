import 'package:flutter/material.dart';
import '../styling.dart';

/// This button is used in all screens
/// usually for switching to the next screen
class SwitchScreenButton extends StatelessWidget {
  const SwitchScreenButton(
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
        backgroundColor: isFaded == false
            ? StylingFiguresColors.switchScreenButtonColor
            : StylingFiguresColors.switchScreenButtonColorFaded,
        minimumSize: const Size(double.infinity, 49),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: StylingTypicalTextStyles.mainFontApplication,
          fontSize: StylingFontSizes.buttonTextFontSize,
          fontWeight: FontWeight.w400,
          color: isFaded == false
              ? StylingFontsColors.switchScreenFontColor
              : StylingFontsColors.switchScreenFontColorFaded,
        ),
      ),
    );
  }
}
