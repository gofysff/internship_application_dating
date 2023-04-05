import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internship_app/registration_screens/first_name_screen/fisrt_name_screen.dart';
import 'package:pinput/pinput.dart';

import '../registration_screens/otp_code_screen/res.dart';
import '../registration_store/registration_store.dart';

class OtpCustomKeyboard extends StatefulWidget {
  const OtpCustomKeyboard({Key? key}) : super(key: key);

  @override
  State<OtpCustomKeyboard> createState() => _OtpCustomKeyboardState();

  @override
  String toStringShort() => 'Rounded Filled';
}

// TODO: refactor this class
class _OtpCustomKeyboardState extends State<OtpCustomKeyboard> {
  final RegistrationStore _registrationStore =
      RegistrationStoreSingletone.instanceOfStore;

  final controller = TextEditingController();
  final focusNode = FocusNode(); // TODO: Understand what is it

  static const borderColor = Color.fromRGBO(169, 169, 169, 1);
  static const errorColor = Color.fromRGBO(255, 234, 238, 1);
  static const fillColor = Color.fromRGBO(255, 255, 255, 1);

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 70,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      color: fillColor,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.transparent),
    ),
  );

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      child: Observer(
        builder: (_) => Pinput(
          length: OtpCodeScreenRes.pinLength,
          controller: controller,
          focusNode: focusNode,
          defaultPinTheme: defaultPinTheme,
          onCompleted: (String pin) {
            _registrationStore.otpCode = pin;

            //TODO: check if pin is correct with masks

            Navigator.pushNamed(context, FirstNameScreen.routename);
          },
          focusedPinTheme: defaultPinTheme.copyWith(
            height: 80,
            width: 64,
            decoration: defaultPinTheme.decoration!.copyWith(
              color: const Color(0xffDEDEDE),
              border: Border.all(color: borderColor),
            ),
          ),
          errorPinTheme: defaultPinTheme.copyWith(
            decoration: BoxDecoration(
              color: errorColor,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
