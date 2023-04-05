import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../general_ui_widgets/general_app_bar_registration.dart';
import '../../registration_store/registration_store.dart';
import '../../styling.dart';
import '../../utils/otp_custom_keyboard.dart';
import 'res.dart';

final RegistrationStore _registrationStore =
    RegistrationStoreSingletone.instanceOfStore;

//TODO: check ?questions
class OtpCodeScreen extends StatefulWidget {
  const OtpCodeScreen({super.key});

  static String routename = "/otp_code_screen";
  @override
  State<OtpCodeScreen> createState() => _OtpCodeScreenState();
}

class _OtpCodeScreenState extends State<OtpCodeScreen> {
  late Observer descriptionTitle = Observer(
    builder: (_) => Text(
      _registrationStore.fullPhoneNumber,
      style: StylingTypicalTextStyles.descriptionTextStyle
          .copyWith(fontSize: StylingFontSizes.textAfterlabel),
    ),
    // TODO: take this style to the rest of the styles
  );

  //TODO: change countrynomber to observalbe

  Text lable = Text(OtpCodeScreenRes.labelText,
      style: StylingTypicalTextStyles.labelTextStyle);

  //TODO: specify the time when the user can get the sms again
  // Timer should use it when we send the sms
  //? I guess it's not the best way to do it
  // ? maybe it will be better to use Timer class
  // or maybe it will be better to use FutureBuilder
  int seconds = 60;
  late Text getSmsAgainText = Text(
    OtpCodeScreenRes.getSmsAgain1 +
        seconds.toString() +
        OtpCodeScreenRes.getSmsAgain2,
    style: StylingTypicalTextStyles.descriptionTextStyle
        .copyWith(color: StylingFontsColors.fadedColor),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalAppBarRegistration,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 48, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            lable,
            const SizedBox(height: 10),
            descriptionTitle,
            const SizedBox(height: 40),
            const OtpCustomKeyboard(),
            const SizedBox(height: 16),
            getSmsAgainText
            // pinput input field
          ],
        ),
      ),
    );
  }
}
