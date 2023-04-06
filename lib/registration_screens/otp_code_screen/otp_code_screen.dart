import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../general_ui_widgets/general_app_bar_registration.dart';
import '../../registration_store/registration_store.dart';
import '../../styling.dart';
import '../../utils/otp_custom_keyboard.dart';
import '../../utils/timer_get_sms_again_widget.dart';
import 'res.dart';

final RegistrationStore _registrationStore =
    RegistrationStoreSingletone.instanceOfStore;

class OtpCodeScreen extends StatefulWidget {
  const OtpCodeScreen({super.key});

  static String routename = "/otp_code_screen";
  @override
  State<OtpCodeScreen> createState() => _OtpCodeScreenState();
}

class _OtpCodeScreenState extends State<OtpCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalAppBarRegistration,
      body: bodyOfTheWidget,
    );
  }

  Widget get bodyOfTheWidget => Padding(
        padding: const EdgeInsets.only(left: 16, right: 48, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            lable,
            const SizedBox(height: 10),
            descriptionOfLabel,
            const SizedBox(height: 40),
            const OtpCustomKeyboard(),
            const SizedBox(height: 16),
            timerGetSmsAgainWithText
            // pinput input field
          ],
        ),
      );

  // smallest parts of the screen
  Text get lable => Text(OtpCodeScreenRes.labelText,
      style: StylingTypicalTextStyles.labelTextStyle);

  Observer get descriptionOfLabel => Observer(
        builder: (_) => Text(
          'Sms sent to +${_registrationStore.fullPhoneNumber}',
          style: StylingTypicalTextStyles.descriptionTextStyleBigger,
        ),
      );

  TimerGetSmsAgainWidget get timerGetSmsAgainWithText =>
      const TimerGetSmsAgainWidget();
}
