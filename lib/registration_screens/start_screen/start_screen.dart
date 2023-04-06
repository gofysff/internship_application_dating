// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:internship_app/registration_screens/phone_number_screen/phone_number_screen.dart';

import '../../general_ui_widgets/main_switch_screen_button.dart';
import '../../styling.dart';
import 'extra_ui/feature.dart';
import 'extra_ui/plug_button.dart';
import 'res.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: bodyOfTheScreen(context)),
    );
  }

  Widget bodyOfTheScreen(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [upperBodyPart, featuresPart, getLowerBodyPart(context)],
          ),
        ),
      );

  Widget get upperBodyPart => Column(
        children: [
          Container(
            //   just simple circle with no functionality 20*20
            width: 52,
            height: 52,
            decoration: const BoxDecoration(
              color: StylingFiguresColors.elipsesColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            StartScreenRes.labelText,
            style: StylingTypicalTextStyles.labelTextStyle,
          ),
          const SizedBox(height: 8),
          Text(
            StartScreenRes.underLabelText,
            style: StylingTypicalTextStyles.descriptionTextStyleFaded,
          ),
        ],
      );

  Widget get featuresPart => Column(
        children: const [
          FeatureWidget(
            titleText: StartScreenRes.title1,
            descriptionText: StartScreenRes.description1,
          ),
          SizedBox(height: 28),
          FeatureWidget(
            titleText: StartScreenRes.title2,
            descriptionText: StartScreenRes.description2,
          ),
          SizedBox(height: 28),
          FeatureWidget(
            titleText: StartScreenRes.title3,
            descriptionText: StartScreenRes.description3,
          ),
        ],
      );

  Widget getLowerBodyPart(BuildContext context) => Column(
        children: [
          getSwitchScreenButton(context),
          const SizedBox(height: 12),
          Row(
            children: const [
              PlugButton(),
              SizedBox(width: 12),
              PlugButton(),
              SizedBox(width: 12),
              PlugButton(),
            ],
          ),
        ],
      );

  // smallest parts of the screen
  SwitchScreenButton getSwitchScreenButton(BuildContext context) =>
      SwitchScreenButton(
        text: StartScreenRes.mainButtonText,
        onPressed: () =>
            Navigator.pushNamed(context, PhoneNumberScreen.routeName),
      );
}
