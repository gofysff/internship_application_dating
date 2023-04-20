import 'dart:async';

import 'package:flutter/material.dart';

import '../res.dart';
import '../../../styling.dart';
import '../store/timer_store.dart/timer_store.dart';

class TimerGetSmsAgainWidget extends StatefulWidget {
  const TimerGetSmsAgainWidget({super.key});

  @override
  State<TimerGetSmsAgainWidget> createState() => _TimerGetSmsAgainWidgetState();
}

class _TimerGetSmsAgainWidgetState extends State<TimerGetSmsAgainWidget> {
  static const int secondsToNewMessage = 60;

  Timer? countdownTimer;
  Duration myDuration = const Duration(seconds: secondsToNewMessage);
  // bool isStarted = false;
  final TimerStateStore _timerStateStore = TimerStateStore.singletoneInstance;
  int? currentTimeInSeconds;

  String get currentTimeAsString => currentTimeInSeconds == null
      ? secondsToNewMessage.toString()
      : currentTimeInSeconds.toString();

  void startTimer() {
    _timerStateStore.isStarted = true;
    countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(
          () {
            if (myDuration.inSeconds > 0) {
              currentTimeInSeconds = myDuration.inSeconds;
              myDuration -= const Duration(seconds: 1);
            } else {
              timer.cancel();
              currentTimeInSeconds = null;
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    resetTimer();
    super.dispose();
  }

  void resetTimer() {
    countdownTimer?.cancel();
    myDuration = const Duration(seconds: secondsToNewMessage);
    _timerStateStore.isStarted = false;
  }

  @override
  Widget build(BuildContext context) {
    if (_timerStateStore.isStarted && countdownTimer == null) {
      startTimer();
    }

    return Text(
      OtpCodeScreenRes.getSmsAgain1 +
          currentTimeAsString.toString() +
          OtpCodeScreenRes.getSmsAgain2,
      style: StylingTypicalTextStyles.descriptionTextStyle
          .copyWith(color: StylingFontsColors.fadedColor),
    );
  }
}
