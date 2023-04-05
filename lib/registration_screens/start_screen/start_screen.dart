// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../general_ui_widgets/main_switch_screen_button.dart';
import '../../styling.dart';
import 'extra_ui/feature.dart';
import 'extra_ui/plug_button.dart';
import 'res.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainSwitchScreenButton buttonToNextScreen = MainSwitchScreenButton(
      text: StartScreenRes.mainButtonText,
      onPressed: () => Navigator.pushNamed(context, '/phone_number_screen'),
    );

    Column features = Column(
      children: const [
        Feature(
          titleText: StartScreenRes.title1,
          descriptionText: StartScreenRes.description1,
        ),
        SizedBox(height: 28),
        Feature(
          titleText: StartScreenRes.title2,
          descriptionText: StartScreenRes.description2,
        ),
        SizedBox(height: 28),
        Feature(
          titleText: StartScreenRes.title3,
          descriptionText: StartScreenRes.description3,
        ),
      ],
    );

    Column upperPart = Column(
      children: [
        Container(
          //   just simple circle with no functionality 20*20
          width: 52,
          height: 52,
          decoration: const BoxDecoration(
            color: kElipsesColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          StartScreenRes.labelText,
          style: kTitleTextStyle,
        ),
        const SizedBox(height: 8),
        Text(
          StartScreenRes.underLabelText,
          style: kDescriptionTextStyle,
        ),
      ],
    );

    Column lowerPart = Column(
      children: [
        buttonToNextScreen,
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
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [upperPart, features, lowerPart],
          ),
        ),
      ),
    )); // TODO: don't forget to add comma
  }
}
