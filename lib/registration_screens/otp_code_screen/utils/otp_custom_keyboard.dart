import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internship_app/registration_screens/first_name_screen/fisrt_name_screen.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../res.dart';
import '../../../registration_store/registration_store.dart';
import '../../../styling.dart';

class OtpCustomKeyboard extends StatefulWidget {
  const OtpCustomKeyboard({Key? key}) : super(key: key);

  @override
  State<OtpCustomKeyboard> createState() => _OtpCustomKeyboardState();

  @override
  String toStringShort() => 'Rounded Filled';
}

class _OtpCustomKeyboardState extends State<OtpCustomKeyboard> {
  RegistrationStore? _registrationStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _registrationStore ??= Provider.of<RegistrationStore>(context);
  }

  final controller = TextEditingController();
  final focusNode = FocusNode();

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
            _registrationStore!.otpCode = pin;

            //TODO: check if pin is correct with masks and http request here

            Navigator.pushNamed(context, FirstNameScreen.routename);
          },
          focusedPinTheme: focusedPinTheme,
          errorPinTheme: errorPinTheme,
        ),
      ),
    );
  }

  PinTheme get defaultPinTheme => PinTheme(
        width: 56,
        height: 70,
        textStyle: const TextStyle(
          fontSize: 22,
          color: StylingOtpCustomKeyboard.textColor,
        ),
        decoration: BoxDecoration(
          color: StylingOtpCustomKeyboard.fillColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.transparent),
        ),
      );

  PinTheme get focusedPinTheme => defaultPinTheme.copyWith(
        height: 80,
        width: 64,
        decoration: defaultPinTheme.decoration!.copyWith(
          color: StylingOtpCustomKeyboard.focusedColor,
          border: Border.all(color: StylingOtpCustomKeyboard.borderColor),
        ),
      );

  PinTheme get errorPinTheme => defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: StylingOtpCustomKeyboard.errorColor,
          borderRadius: BorderRadius.circular(8),
        ),
      );
}
