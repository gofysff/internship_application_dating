import 'dart:async';

import 'package:flutter/material.dart';

import '../registration_screens/otp_code_screen/res.dart';
import '../styling.dart';

class TimerGetSmsAgainWidget extends StatefulWidget {
  const TimerGetSmsAgainWidget({super.key});

  @override
  State<TimerGetSmsAgainWidget> createState() => _TimerGetSmsAgainWidgetState();
}

class _TimerGetSmsAgainWidgetState extends State<TimerGetSmsAgainWidget> {
  static const int secondsToNewMessage = 60;
  // TODO: specify some things about timer work and state for it
  // specify the time when the user can get the sms again
  // specify what is actually have to start timer
  Timer? countdownTimer;
  Duration myDuration = const Duration(seconds: secondsToNewMessage);

  void startTimer() {
    countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(
          () {
            if (myDuration.inSeconds > 0) {
              myDuration -= const Duration(seconds: 1);
            } else {
              timer.cancel();
            }
          },
        );
      },
    );
  }

  void resetTimer() {
    countdownTimer?.cancel();
    myDuration = const Duration(seconds: secondsToNewMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      OtpCodeScreenRes.getSmsAgain1 +
          secondsToNewMessage.toString() +
          OtpCodeScreenRes.getSmsAgain2,
      style: StylingTypicalTextStyles.descriptionTextStyle
          .copyWith(color: StylingFontsColors.fadedColor),
    );
  }
}
