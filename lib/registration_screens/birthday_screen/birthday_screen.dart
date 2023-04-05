import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internship_app/registration_screens/create_nickname_screen/create_nickname_screen.dart';
import '../../general_ui_widgets/general_app_bar_registration.dart';
import '../../general_ui_widgets/main_switch_screen_button.dart';
import '../../general_ui_widgets/progress_bar_indicator.dart';
import '../../registration_store/registration_store.dart';
import '../../styling.dart';
import 'res.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  static const routeName = '/birthday_screen';
  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final RegistrationStore _registrationStore =
      RegistrationStoreSingletone.instanceOfStore;

  Text label = Text(BirthdayScreenRes.labelText, style: kTitleTextStyle);
  Text beneathInputField = Text(BirthdayScreenRes.textBeneathInputField,
      style:
          kDescriptionTextStyle.copyWith(color: StylingFontsColors.fadedColor));

  late SwitchScreenButton buttonToNextScreen = SwitchScreenButton(
      text: BirthdayScreenRes.mainSwitchButtonText,
      onPressed: () {
        Navigator.pushNamed(context, CreateNicknameScreen.routename);
      });

  late Observer keyboard = Observer(
    builder: (_) => TextField(
      onChanged: (value) => _registrationStore.birthday = value,
      keyboardType: TextInputType.datetime,
      decoration: const InputDecoration(

          // fillColor: Color(0xFFE5E5E5), //? why this is not working
          border: OutlineInputBorder(),
          hintStyle: TextStyle(color: StylingFontsColors.fadedColor),
          hintText: BirthdayScreenRes.textInInputField),
      // TODO: add  slashes to this field after the user enters the first two numbers (DD) and the first two numbers (MM)
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalAppBarRegistration,
      body: Column(
        children: [
          const IndicatorProgressBar(
              currentStep: BirthdayScreenRes.currentProgress,
              totalSteps: BirthdayScreenRes.maxProgress),
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
                beneathInputField,
                const SizedBox(height: 20),
                buttonToNextScreen,
              ],
            ),
          ),
        ],
      ),
    );
  }
}