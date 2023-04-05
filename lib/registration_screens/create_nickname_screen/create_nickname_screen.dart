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

// TODO: create nickname res

class _CreateNicknameScreenState extends State<CreateNicknameScreen> {
  final RegistrationStore _registrationStore =
      RegistrationStoreSingletone.instanceOfStore;

  Text label = Text(CreateNicknameScreenRes.labelText, style: kTitleTextStyle);

  Text beneathInputField1 = Text(CreateNicknameScreenRes.textBeneathInputField1,
      style:
          kDescriptionTextStyle.copyWith(color: StylingFontsColors.fadedColor));
  Text beneathInputField2 = Text(CreateNicknameScreenRes.textBeneathInputField2,
      style:
          kDescriptionTextStyle.copyWith(color: StylingFontsColors.fadedColor));

  Text askToShowRealName = Text(CreateNicknameScreenRes.askToShowRealName,
      style: kDescriptionTextStyle);

  AskUserButton askUserButton =
      const AskUserButton(text: CreateNicknameScreenRes.askToShowRealName);

  late SwitchScreenButton buttonToNextScreen = SwitchScreenButton(
    text: CreateNicknameScreenRes.mainSwitchButtonText,
    onPressed: () {
      Navigator.pushNamed(context, GenderSelectScreen.routeName);
      _registrationStore.showEveryoneRealName = askUserButton.isPressed;
    },
  );

  late TextField keyboard = TextField(
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

  IndicatorProgressBar indicatorProgressBar = const IndicatorProgressBar(
    currentStep: CreateNicknameScreenRes.currentProgress,
    totalSteps: CreateNicknameScreenRes.maxProgress,
  );

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
          ),
        ],
      ),
    );
  }
}
