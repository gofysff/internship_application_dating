// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internship_app/registration_screens/birthday_screen/birthday_screen.dart';
import 'package:internship_app/validations/validation_store/validation_store.dart';
import 'package:provider/provider.dart';

import '../../general_ui_widgets/general_app_bar_registration.dart';
import '../../general_ui_widgets/main_switch_screen_button.dart';
import '../../general_ui_widgets/progress_bar_indicator.dart';
import '../../registration_store/registration_store.dart';
import '../../styling.dart';
import 'res.dart';

class FirstNameScreen extends StatefulWidget {
  static const String routename = "/first_name_screen";

  const FirstNameScreen({super.key});

  @override
  State<FirstNameScreen> createState() => _FirstNameScreenState();
}

class _FirstNameScreenState extends State<FirstNameScreen> {
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
      body: bodyOfTheWidget,
    );
  }

  Widget get bodyOfTheWidget => Column(
        children: [
          indicatorProgressBar,
          mainBodyPart,
        ],
      );

  Widget get mainBodyPart => Padding(
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
          ],
        ),
      );

  IndicatorProgressBar get indicatorProgressBar => const IndicatorProgressBar(
        currentStep: FirstNameScreenRes.currentProgress,
        totalSteps: FirstNameScreenRes.maxProgress,
      );

  //smallest pieces of the screen

  Text lable = Text(FirstNameScreenRes.labelText,
      style: StylingTypicalTextStyles.labelTextStyle);

  Observer get keyboard => Observer(
        builder: (_) => TextField(
          cursorColor: StylingOtherColors.coursorTextKeyboardColor,
          onChanged: (value) => _registrationStore!.firstName = value,
        ),
      );

  Text beneathInputField = Text(FirstNameScreenRes.textBeneathInputField,
      style: StylingTypicalTextStyles.fadedSlightTextStyle);

  Observer get buttonToNextScreen => Observer(
        builder: (_) => SwitchScreenButton(
            isFaded: _validationStore!.isCorrectFirstName == false,
            text: FirstNameScreenRes.mainSwitchButtonText,
            onPressed: () {
              if (_validationStore!.isCorrectFirstName == false) {
                return;
              }
              Navigator.pushNamed(context, BirthdayScreen.routeName);
            }),
      );
}
