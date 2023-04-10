import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internship_app/registration_screens/create_nickname_screen/create_nickname_screen.dart';
import 'package:masked_text_field/masked_text_field.dart';
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
  final TextEditingController _dateController = TextEditingController();
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
        indicatorProgressBar,
        mainBodyPart,
      ],
    );
  }

  Widget get mainBodyPart => Padding(
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
      );

  // smallest parts of the Screen

  IndicatorProgressBar get indicatorProgressBar => const IndicatorProgressBar(
        currentStep: BirthdayScreenRes.currentProgress,
        totalSteps: BirthdayScreenRes.maxProgress,
      );

  Text get label => Text(
        BirthdayScreenRes.labelText,
        style: StylingTypicalTextStyles.labelTextStyle,
      );

  Observer get keyboard => Observer(
        builder: (_) => MaskedTextField(
          textFieldController: _dateController,
          inputDecoration: const InputDecoration(
            counterText: "",
            border: OutlineInputBorder(),
            hintStyle: TextStyle(color: StylingFontsColors.fadedColor),
            hintText: BirthdayScreenRes.hintInTextField,
          ),
          maxLength: 10,
          mask: BirthdayScreenRes.maskInputField,
          onChange: (value) => _registrationStore.birthday = value,
          keyboardType: TextInputType.datetime,
        ),
      );

  Text get beneathInputField => Text(BirthdayScreenRes.textBeneathInputField,
      style: StylingTypicalTextStyles.descriptionTextStyleFaded);

  SwitchScreenButton get buttonToNextScreen => SwitchScreenButton(
      text: BirthdayScreenRes.mainSwitchButtonText,
      onPressed: () {
        Navigator.pushNamed(context, CreateNicknameScreen.routename);
      });
}
