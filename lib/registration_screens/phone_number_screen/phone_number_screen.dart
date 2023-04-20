import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internship_app/registration_screens/otp_code_screen/otp_code_screen.dart';

import 'package:internship_app/registration_screens/phone_number_screen/utils/phone_number_keyboard.dart';
import 'package:internship_app/registration_screens/phone_number_screen/utils/privacy_policy.dart';
import 'package:internship_app/validations/validation_store/validation_store.dart';
import 'package:provider/provider.dart';

import '../../general_ui_widgets/main_switch_screen_button.dart';

import '../../styling.dart';
import 'res.dart';

class PhoneNumberScreen extends StatefulWidget {
  static const String routeName = '/phone_number_screen';

  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  late double widthOfScreen;
  late double heightOfScreen;
  ValidationStore? _validationStore;
  // RegistrationStore? _registrationStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _validationStore ??= Provider.of<ValidationStore>(context);
    //  _registrationStore ??= Provider.of<RegistrationStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    widthOfScreen = MediaQuery.of(context).size.width;
    heightOfScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: StylingBasicColors.scaffoldBackgroundColor,
      body: bodyOfTheScreen,
    );
  }

  Widget get bodyOfTheScreen => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 75,
            ),
            label,
            const SizedBox(height: 62),
            Column(
              children: [
                PhoneNumberKeyboardWidget(
                  widthOfScreen: widthOfScreen,
                  buttonToNextScreen: buttonToNextScreen,
                ),
                const SizedBox(height: 16),
                const PrivacyPolicyWidget(),
              ],
            ),
          ],
        ),
      );

//smallest parts of the screen
  Text get label => Text(
        PhoneNumberScreenRes.labelText,
        style: StylingTypicalTextStyles.labelTextStyle,
      );

  Observer get buttonToNextScreen => Observer(
        builder: (_) => SwitchScreenButton(
          isFaded: _validationStore!.isCorrectPhoneNumber == false,
          text: PhoneNumberScreenRes.mainSwitchButtonText,
          onPressed: () {
            if (_validationStore!.isCorrectPhoneNumber == false) {
              return;
            }
            Navigator.pushNamed(context, OtpCodeScreen.routename);
          },
        ),
      );
}
