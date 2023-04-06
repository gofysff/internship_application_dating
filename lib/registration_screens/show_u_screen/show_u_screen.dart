import 'package:flutter/material.dart';

import '../../general_ui_widgets/general_app_bar_registration.dart';
import '../../general_ui_widgets/list_with_one_selected_button/list_with_one_selected_button.dart';
import '../../general_ui_widgets/main_switch_screen_button.dart';
import '../../general_ui_widgets/progress_bar_indicator.dart';
import '../../registration_store/registration_store.dart';
import '../../styling.dart';
import 'res.dart';

class ShowYouScreen extends StatefulWidget {
  const ShowYouScreen({super.key});

  static const routeName = '/show_you_screen';

  @override
  State<ShowYouScreen> createState() => _ShowYouScreenState();
}

class _ShowYouScreenState extends State<ShowYouScreen> {
  final RegistrationStore _registrationStore =
      RegistrationStoreSingletone.instanceOfStore;

  // save buttons in variables to get access to it state

  ListWithOneSelectedButton genderList = ListWithOneSelectedButton(
    buttonsTextValues: ShowYouScreenRes.buttonValues,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalAppBarRegistration,
      body: bodyOfTheScreen,
    );
  }

  Widget get bodyOfTheScreen => Column(
        children: [
          mainBodyPart,
          lowerBodyPart,
        ],
      );

  Expanded get mainBodyPart => Expanded(
        flex: 2,
        child: Column(
          children: [
            indicatorProgressBar,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  label,
                  const SizedBox(height: 32),
                  genderList
                ],
              ),
            )
          ],
        ),
      );

  Expanded get lowerBodyPart => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: buttonToNextScreen,
          ),
        ),
      );

  // smallest parts of the screen

  IndicatorProgressBar get indicatorProgressBar => const IndicatorProgressBar(
        currentStep: ShowYouScreenRes.currentProgress,
        totalSteps: ShowYouScreenRes.maxProgress,
      );

  Text label = Text(
    ShowYouScreenRes.labelText,
    style: StylingTypicalTextStyles.labelTextStyle,
  );

  SwitchScreenButton get buttonToNextScreen => SwitchScreenButton(
        text: ShowYouScreenRes.mainSwitchButtonText,
        onPressed: () {
          //  Todo: add navigation to the next screen
          _registrationStore.showYou = genderList.getSelectedButtonValue;
          print(_registrationStore.toString());
        },
      );
}
