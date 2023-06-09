// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:internship_app/registration_screens/gender_select_screen/gender_select_screen.dart';

import 'package:internship_app/general_ui_widgets/ask_user_button/ask_user_button.dart';
import 'package:internship_app/general_ui_widgets/general_app_bar_registration.dart';
import 'package:internship_app/general_ui_widgets/main_switch_screen_button.dart';
import 'package:internship_app/general_ui_widgets/progress_bar_indicator.dart';
import 'package:internship_app/registration_store/registration_store.dart';
import 'package:internship_app/styling.dart';
import 'package:internship_app/validations/validation_store/validation_store.dart';
import 'package:provider/provider.dart';
import 'res.dart';

class CreateNicknameScreen extends StatefulWidget {
  const CreateNicknameScreen({super.key});

  static const String routename = '/create_nickname_screen';
  @override
  State<CreateNicknameScreen> createState() => _CreateNicknameScreenState();
}

class _CreateNicknameScreenState extends State<CreateNicknameScreen> {
  // save buttons in variables to get access of it state
  AskUserButton askUserButtonToShowName =
      const AskUserButton(text: CreateNicknameScreenRes.askToShowRealName);

  ValidationStore? _validationStore;
  RegistrationStore? _registrationStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _validationStore ??= Provider.of<ValidationStore>(context);
    _registrationStore ??= Provider.of<RegistrationStore>(context);
  }

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
        onChanged: (value) => _registrationStore!.nickname = value,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
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

  Observer get buttonToNextScreen => Observer(
      builder: (_) => SwitchScreenButton(
            text: CreateNicknameScreenRes.mainSwitchButtonText,
            isFaded: _validationStore!.isCorrectNickname == false,
            onPressed: () {
              // print(
              //     '${_createNicknameScreenStore.isCorrectNickname} - is correct nickname');
              // print(
              //     '${_createNicknameScreenStore.isFadedButtonToNextScreen} - is faded button}');
              if (_validationStore!.isCorrectNickname == false) return;
              Navigator.pushNamed(context, GenderSelectScreen.routeName);

              _registrationStore!.showEveryoneRealName =
                  askUserButtonToShowName.isPressed;
            },
          ));
}
