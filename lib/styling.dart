import 'package:flutter/material.dart';

class StylingMainAplicationTheme {
  static ThemeData get mainThemeData => ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: StylingOtherColors.cursorColor,
          selectionColor: StylingOtherColors.cursorColor,
          selectionHandleColor: StylingOtherColors.cursorColor,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              // style: BorderStyle.solid,
              color: StylingOtherColors.borderInputFieldColor,
            ),
          ),
        ),
        useMaterial3: true,
      );
}

class StylingFiguresColors {
  static const plugButtonBackground = Color(0xffF2F2F2);
  static const Color backgroundColor = Color(0xffCECECE);
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

class StylingOtherColors {
  static const Color coursorTextKeyboardColor = Colors.black;
  static const Color borderAroundTextFieldColor = Colors.grey;
  static const Color textFieldBackgroundColor = Color(0xffF1F0F0);

  static const Color cursorColor = Color(0xff909090);
  static const Color borderInputFieldColor = cursorColor;
}

class StylingBasicColors {
  static const scaffoldBackgroundColor = Colors.white;
}

class StylingFontSizes {
  static const double titleFontSize = 24;
  static const double descriptionFontSize = 14;

  static const double textAfterlabel = 16;
  static const double buttonTextFontSize = 18;
}

class StylingTypicalTextStyles {
  // font Manrope from Google Fonts
  static const String mainFontApplication = 'Manrope';

// typical text styles for labels
  static TextStyle labelTextStyle = const TextStyle(
    fontFamily: mainFontApplication,
    fontSize: StylingFontSizes.titleFontSize,
    fontWeight: FontWeight.bold,
    color: StylingFontsColors.mainTextColor,
  );

  /// used for text in the middle of the screen(not the most important)
  static TextStyle fadedSlightTextStyle = const TextStyle(
    fontFamily: mainFontApplication,
    fontSize: StylingFontSizes.descriptionFontSize,
    fontWeight: FontWeight.w400,
    color: StylingFontsColors.fadedColor,
  );

  static TextStyle descriptionTextStyle = const TextStyle(
    fontFamily: mainFontApplication,
    fontSize: StylingFontSizes.descriptionFontSize,
    fontWeight: FontWeight.w400,
    color: StylingFontsColors.mainTextColor,
  );

  static TextStyle descriptionTextStyleBigger = StylingTypicalTextStyles
      .descriptionTextStyle
      .copyWith(fontSize: StylingFontSizes.textAfterlabel);

  static TextStyle descriptionTextStyleFaded = const TextStyle(
    fontFamily: mainFontApplication,
    fontSize: StylingFontSizes.descriptionFontSize,
    fontWeight: FontWeight.w400,
    color: StylingFontsColors.fadedColor,
  );
}

class StylingOtpCustomKeyboard {
  static const borderColor = Color.fromRGBO(169, 169, 169, 1);
  static const errorColor = Color.fromRGBO(255, 234, 238, 1);
  static const fillColor = Color.fromRGBO(255, 255, 255, 1);

  static const focusedColor = Color(0xffDEDEDE);
  static const textColor = Color.fromRGBO(30, 60, 87, 1);
}
