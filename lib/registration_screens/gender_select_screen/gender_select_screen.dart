// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../general_ui_widgets/ask_user_button/ask_user_button.dart';
import '../../general_ui_widgets/general_app_bar_registration.dart';
import '../../general_ui_widgets/list_with_one_selected_button/list_with_one_selected_button.dart';
import '../../general_ui_widgets/main_switch_screen_button.dart';
import '../../general_ui_widgets/progress_bar_indicator.dart';
import '../../registration_store/registration_store.dart';
import '../../styling.dart';
import 'res.dart';

class GenderSelectScreen extends StatefulWidget {
  const GenderSelectScreen({super.key});

  @override
  State<GenderSelectScreen> createState() => _GenderSelectScreenState();
}

class _GenderSelectScreenState extends State<GenderSelectScreen> {
  final RegistrationStore _registrationStore =
      RegistrationStoreSingletone.instanceOfStore;

  Text label = Text(GenderSelectScreenRes.labelText, style: kTitleTextStyle);

  Text beneathLabel = Text(GenderSelectScreenRes.textBeneathLabel,
      style: kDescriptionTextStyle.copyWith(color: kFadedColor));
  late MainSwitchScreenButton buttonToNextScreen = MainSwitchScreenButton(
      text: GenderSelectScreenRes.mainSwitchButtonText,
      onPressed: () {
        Navigator.pushNamed(context, '/show_u_screen');
        _registrationStore.gender = genderList.getSelectedButtonValue;
        _registrationStore.showGenderOnProfile = askUserButton.isPressed;
      });

  ListWithOneSelectedButton genderList = const ListWithOneSelectedButton(
    buttonsTextValues: GenderSelectScreenRes.buttonValues,

    // isFaded: false,
  );

  AskUserButton askUserButton =
      const AskUserButton(text: GenderSelectScreenRes.askToShowGender);

  IndicatorProgressBar indicatorProgressBar = const IndicatorProgressBar(
      currentStep: GenderSelectScreenRes.currentProgress,
      totalSteps: GenderSelectScreenRes.maxProgress);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: generalAppBarRegistration,
        body: Column(
          children: [
            Expanded(
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
                            const SizedBox(height: 19),
                            beneathLabel,
                            const SizedBox(height: 32),
                            genderList
                          ]))
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    askUserButton,
                    const SizedBox(height: 20),
                    buttonToNextScreen,
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
