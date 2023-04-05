// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../general_ui_widgets/general_app_bar_registration.dart';
import '../../general_ui_widgets/main_switch_screen_button.dart';
import '../../general_ui_widgets/progress_bar_indicator.dart';
import '../../registration_store/registration_store.dart';
import '../../styling.dart';
import 'res.dart';

class FirstNameScreen extends StatefulWidget {
  const FirstNameScreen({super.key});

  @override
  State<FirstNameScreen> createState() => _FirstNameScreenState();
}

class _FirstNameScreenState extends State<FirstNameScreen> {
  final RegistrationStore _registrationStore =
      RegistrationStoreSingletone.instanceOfStore;

  Text lable = Text(FirstNameScreenRes.labelText, style: kTitleTextStyle);
  Text beneathInputField = Text(FirstNameScreenRes.textBeneathInputField,
      style: kDescriptionTextStyle.copyWith(color: kFadedColor));

  late MainSwitchScreenButton buttonToNextScreen = MainSwitchScreenButton(
      text: FirstNameScreenRes.mainSwitchButtonText,
      onPressed: () {
        Navigator.pushNamed(context, '/birthday_screen');
      });

  late Observer keyboard = Observer(
    builder: (_) => TextField(
      onChanged: (value) => _registrationStore.firstName = value,
      decoration: const InputDecoration(
        // TODO: change color of the border
        border: OutlineInputBorder(),
        // labelText: 'First Name',
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: generalAppBarRegistration,
        body: Column(
          children: [
            const IndicatorProgressBar(
                currentStep: FirstNameScreenRes.currentProgress,
                totalSteps: FirstNameScreenRes.maxProgress),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    lable,
                    const SizedBox(height: 32),
                    keyboard,
                    const SizedBox(height: 16),
                    beneathInputField,
                    const SizedBox(height: 20),
                    buttonToNextScreen,
                  ]),
            ),
          ],
        ));
  }
}
