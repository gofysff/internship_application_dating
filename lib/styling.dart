import 'package:flutter/material.dart';

// TODO: remove k prefix and wrap colors and others into class with static fields
// colors

class StylingFiguresColors {
  static const plugButtonBackground = Color(0xffF2F2F2);
  static const Color kbackgroundColor = Color(0xffCECECE);
  static const Color elipsesColor = Color(0xffD9D9D9);

  static const Color switchScreenButtonColor = Color(0xff909090);
  static const Color switchScreenButtonColorFaded = Color(0xffEAEAEA);

  static const Color minorButtonsColor = Color(0xffF2F2F2);
}

class StylingFontsColors {
  static const Color mainTextColor = Color(0xff000000);
  static const Color minorTextColor = Color(0xff747474);

  static const Color fadedColor = Color(0xffADADAD);

  static const Color switchScreenFontColor = Color(0xffFFFFFF);
  static const Color switchScreenFontColorFaded = Color(0xffA4A4A4);
}
// typicall font sizes

class OtherColors {
  static const Color coursorTextKeyboardColor = Colors.black;
}

const double kTitleFontSize = 24;
const double kDescriptionFontSize = 14;
const double kButtonTextFontSize = 18;

// font Manrope from Google Fonts
const String kMainFont = 'Manrope';

// typical text styles for titles
TextStyle kTitleTextStyle = const TextStyle(
  fontFamily: kMainFont,
  fontSize: kTitleFontSize,
  fontWeight: FontWeight.bold,
  color: StylingFontsColors.mainTextColor,
);

TextStyle kFadedTextStyle = const TextStyle(
  fontFamily: kMainFont,
  fontSize: kDescriptionFontSize,
  fontWeight: FontWeight.w400,
  color: StylingFontsColors.fadedColor,
);

TextStyle kDescriptionTextStyle = const TextStyle(
  fontFamily: kMainFont,
  fontSize: kDescriptionFontSize,
  fontWeight: FontWeight.w400,
  color: StylingFontsColors.mainTextColor,
);
