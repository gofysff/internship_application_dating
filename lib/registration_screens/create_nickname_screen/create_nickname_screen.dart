// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:internship_app/registration_screens/gender_select_screen/gender_select_screen.dart';

import '../../general_ui_widgets/ask_user_button/ask_user_button.dart';
import '../../general_ui_widgets/general_app_bar_registration.dart';
import '../../general_ui_widgets/main_switch_screen_button.dart';
import '../../general_ui_widgets/progress_bar_indicator.dart';
import '../../registration_store/registration_store.dart';
import '../../styling.dart';
import 'res.dart';

class CreateNicknameScreen extends StatefulWidget {
  const CreateNicknameScreen({super.key});

  static const String routename = '/create_nickname_screen';
  @override
  State<CreateNicknameScreen> createState() => _CreateNicknameScreenState();
}

class _CreateNicknameScreenState extends State<CreateNicknameScreen> {
  final RegistrationStore _registrationStore =
      RegistrationStoreSingletone.instanceOfStore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalAppBarRegistration,
      body: bodyOfTheScreen,
    );
  }

  Widget get bodyOfTheScreen {
    return Column(
      children: [
        mainBodyPart,
        lowerBodyPartWithButtons,
      ],
    );
  }

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
                  keyboard,
                  const SizedBox(height: 16),
                  beneathInputField1,
                  const SizedBox(height: 16),
                  beneathInputField2,
                ],
              ),
            )
          ],
        ),
      );

  Expanded get lowerBodyPartWithButtons => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              askUserButtonToShowName,
              const SizedBox(height: 20),
              buttonToNextScreen,
            ],
          ),
        ),
      );

  // smallest parts of the screen

  IndicatorProgressBar get indicatorProgressBar => const IndicatorProgressBar(
        currentStep: CreateNicknameScreenRes.currentProgress,
        totalSteps: CreateNicknameScreenRes.maxProgress,
      );

  Text get label => Text(
        CreateNicknameScreenRes.labelText,
        style: StylingTypicalTextStyles.labelTextStyle,
      );

  TextField get keyboard => TextField(
        onChanged: (value) {
          _registrationStore.nickname = value;
        },
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          // TODO: change keyboard color
          // fillColor: Color(0xFFE5E5E5), //? why this is not working
          border: OutlineInputBorder(),
          hintStyle: TextStyle(color: StylingFontsColors.fadedColor),
        ),
      );

  Text get beneathInputField1 => Text(
        CreateNicknameScreenRes.textBeneathInputField1,
        style: StylingTypicalTextStyles.descriptionTextStyleFaded,
      );

  Text get beneathInputField2 => Text(
        CreateNicknameScreenRes.textBeneathInputField2,
        style: StylingTypicalTextStyles.descriptionTextStyleFaded,
      );

  AskUserButton get askUserButtonToShowName =>
      const AskUserButton(text: CreateNicknameScreenRes.askToShowRealName);

  SwitchScreenButton get buttonToNextScreen => SwitchScreenButton(
        text: CreateNicknameScreenRes.mainSwitchButtonText,
        onPressed: () {
          Navigator.pushNamed(context, GenderSelectScreen.routeName);
          _registrationStore.showEveryoneRealName =
              askUserButtonToShowName.isPressed;
        },
      );
}
