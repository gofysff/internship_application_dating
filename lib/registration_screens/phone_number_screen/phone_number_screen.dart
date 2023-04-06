import 'package:flag/flag.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:internship_app/registration_screens/otp_code_screen/otp_code_screen.dart';
import 'package:internship_app/registration_store/registration_store.dart';

import '../../general_ui_widgets/main_switch_screen_button.dart';
import '../../styling.dart';
import 'res.dart';

class PhoneNumberScreen extends StatefulWidget {
  static const String routeName = '/phone_number_screen';

  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final RegistrationStore _registrationStore =
      RegistrationStoreSingletone.instanceOfStore;

  late double widthOfScreen;
  late double heightOfScreen;

  @override
  Widget build(BuildContext context) {
    widthOfScreen = MediaQuery.of(context).size.width;
    heightOfScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: StylingBasicColors.scaffoldBackgroundColor,
      body: bodyOfTheScreen,
    );
  }

  Widget get bodyOfTheScreen => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 75,
            ),
            label,
            const SizedBox(height: 62),
            Column(
              children: [
                keyboardWithButtonToNextScreen,
                const SizedBox(height: 16),
                privacyPolicy
              ],
            ),
          ],
        ),
      );

  // next will be splitted into small parts describing of keyboard
  Widget get keyboardWithButtonToNextScreen => Observer(
        builder: (_) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              PhoneNumberScreenRes.textAboveButtonToKeyboard,
              style: StylingTypicalTextStyles.descriptionTextStyle,
            ),
            completeWrappedKeyboard,
            const SizedBox(height: 16),
            buttonToNextScreen,
          ],
        ),
      );

  Widget get completeWrappedKeyboard => Container(
        decoration: BoxDecoration(
          color: StylingOtherColors.textFieldBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          border:
              Border.all(color: StylingOtherColors.borderAroundTextFieldColor),
        ),
        child: completeKeyboardWithoutWraping,
      );

  Widget get completeKeyboardWithoutWraping => Row(
        children: [
          const SizedBox(width: 12),
          Flag.fromCode(FlagsCode.RU, height: 24, width: 24),
          const SizedBox(width: 8),
          Text(
            '+${_registrationStore.countryNumber}',
            style: StylingTypicalTextStyles.descriptionTextStyle,
          ),
          const SizedBox(width: 30),
          keyboardField,
        ],
      );

  // part of keyboard only where we can input number
  Widget get keyboardField => SizedBox(
        width: widthOfScreen - 106 - 16 * 2,
        // width limitation because of Row
        child: TextField(
          cursorColor: StylingOtherColors.coursorTextKeyboardColor,
          onChanged: (String inputString) {
            _registrationStore.phoneNumber = inputString;
          },
          decoration: const InputDecoration(focusColor: Colors.black
              //? why focusColor not working?
              ),
          keyboardType: TextInputType.phone,
          // cursorColor: , // TODO check this option for styling
        ),
      );

//smallest parts of the screen
  Text get label => Text(
        PhoneNumberScreenRes.labelText,
        style: StylingTypicalTextStyles.labelTextStyle,
      );

  RichText get privacyPolicy => RichText(
        text: TextSpan(
          text: PhoneNumberScreenRes.aboutPrivacyPolicy,
          style: StylingTypicalTextStyles.fadedSlightTextStyle,
          children: [
            TextSpan(
              text: PhoneNumberScreenRes.textWithLinkToPrivacyPolicy,
              style: StylingTypicalTextStyles.fadedSlightTextStyle
                  .copyWith(color: Colors.black),
            ),
            const TextSpan(text: PhoneNumberScreenRes.andText),
            TextSpan(
              text: PhoneNumberScreenRes.textWithLinkToUserAgreement,
              style: StylingTypicalTextStyles.fadedSlightTextStyle
                  .copyWith(color: Colors.black),
            ),
          ],
        ),
      );

  SwitchScreenButton get buttonToNextScreen => SwitchScreenButton(
        text: PhoneNumberScreenRes.mainSwitchButtonText,
        onPressed: () {
          Navigator.pushNamed(context, OtpCodeScreen.routename);
        },
      );
}
