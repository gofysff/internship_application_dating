import 'package:flutter/material.dart';
import 'package:internship_app/registration_screens/phone_number_screen/res.dart';
import 'package:internship_app/styling.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  const PrivacyPolicyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
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
  }
}
