import 'package:flag/flag.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
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

//Todo: find out how to get access to number after user input it

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final RegistrationStore _registrationStore =
      RegistrationStoreSingletone.instanceOfStore;

  late double widthOfScreen;
  late double heightOfScreen;
  Text title = Text(PhoneNumberScreenRes.labelText, style: kTitleTextStyle);

  // panel where user input phone number
  late MainSwitchScreenButton buttonToNextScreen = MainSwitchScreenButton(
      text: PhoneNumberScreenRes.mainSwitchButtonText,
      onPressed: () {
        Navigator.pushNamed(context, '/otp_code_screen');
      });

  late Column inputNumberPanel = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(PhoneNumberScreenRes.textAboveButtonToKeyboard,
          style: kDescriptionTextStyle),
      Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 241, 240, 240),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey)),
        child: Row(children: [
          const SizedBox(width: 12),
          Flag.fromCode(FlagsCode.RU, height: 24, width: 24),
          const SizedBox(width: 8),
          Text('+', style: kDescriptionTextStyle),
          Text('7', style: kDescriptionTextStyle),
          const SizedBox(width: 30),
          SizedBox(
            width: widthOfScreen - 106 - 16 * 2,
            child: Observer(
              builder: (_) => TextField(
                onChanged: (String inputString) {
                  _registrationStore.phoneNumber = inputString;
                },
                decoration: const InputDecoration(focusColor: Colors.black

                    //TODO: ask why focusColor not working?
                    //? why focusColor not working?
                    ),
                keyboardType: TextInputType.phone,
                // cursorColor: , // TODO check this option for styling
              ),
            ),
          )
        ]),
      ),
      const SizedBox(height: 16),
      buttonToNextScreen,
    ],
  );

  RichText privacyPolicy = RichText(
    text: TextSpan(
      text: PhoneNumberScreenRes.aboutPrivacyPolicy,
      style: kFadedTextStyle,
      children: [
        TextSpan(
          text: PhoneNumberScreenRes.textWithLinkToPrivacyPolicy,
          style: kFadedTextStyle.copyWith(color: Colors.black),
        ),
        const TextSpan(text: PhoneNumberScreenRes.andText),
        TextSpan(
          text: PhoneNumberScreenRes.textWithLinkToUserAgreement,
          style: kFadedTextStyle.copyWith(color: Colors.black),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    widthOfScreen = MediaQuery.of(context).size.width;
    heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      //?
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: 76),
            Expanded(
                child: Column(
              children: [
                const SizedBox(
                  height: 75,
                ),
                title,
                const SizedBox(height: 62),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    inputNumberPanel,
                    const SizedBox(height: 16),
                    privacyPolicy
                  ],
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
