import 'package:flutter/material.dart';

// colors
const Color kbackgroundColor = Color(0xffCECECE);
const Color kElipsesColor = Color(0xffD9D9D9);
const Color kMainButtonsColor = Color(0xff909090);
const Color kMinorButtonsColor = Color(0xffF2F2F2);

const Color kMainTextColor = Color(0xff000000);
const Color kMinorTextColor = Color(0xff747474);
const Color kFadedColor = Color(0xffADADAD);
const Color kMainButtonSwitchTextColor = Color(0xffFFFFFF);

// typicall font sizes
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
  color: kMainTextColor,
);

TextStyle kFadedTextStyle = const TextStyle(
  fontFamily: kMainFont,
  fontSize: kDescriptionFontSize,
  fontWeight: FontWeight.w400,
  color: kFadedColor,
);

TextStyle kDescriptionTextStyle = const TextStyle(
  fontFamily: kMainFont,
  fontSize: kDescriptionFontSize,
  fontWeight: FontWeight.w400,
  color: kMainTextColor,
);
