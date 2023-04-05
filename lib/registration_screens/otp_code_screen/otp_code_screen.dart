import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../general_ui_widgets/general_app_bar_registration.dart';
import '../../registration_store/registration_store.dart';
import '../../styling.dart';
import 'res.dart';
import 'package:pinput/pinput.dart';

final RegistrationStore _registrationStore =
    RegistrationStoreSingletone.instanceOfStore;

//TODO: check ?questions
class OTPcodeScreen extends StatefulWidget {
  const OTPcodeScreen({super.key});

  @override
  State<OTPcodeScreen> createState() => _OTPcodeScreenState();
}

class _OTPcodeScreenState extends State<OTPcodeScreen> {
  late Observer descriptionTitle = Observer(
      builder: (_) => Text(_registrationStore.fullPhoneNumber,
          style: kDescriptionTextStyle.copyWith(fontSize: 16)));
  //TODO: change countrynomber to observalbe

  Text lable = Text(OTPcodeScreenRes.labelText, style: kTitleTextStyle);
  //TODO: specify the time when the user can get the sms again
  // Timer should use it when we send the sms
  //? I guess it's not the best way to do it
  // ? maybe it will be better to use Timer class
  // or maybe it will be better to use FutureBuilder
  int seconds = 60;
  late Text getSmsAgainText = Text(
      OTPcodeScreenRes.getSmsAgain1 +
          seconds.toString() +
          OTPcodeScreenRes.getSmsAgain2,
      style: kDescriptionTextStyle.copyWith(color: kFadedColor));
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
              const FilledRoundedPinPut(),
              const SizedBox(height: 16),
              getSmsAgainText
              // pinput input field
            ],
          )),
    );
  }
}

class FilledRoundedPinPut extends StatefulWidget {
  const FilledRoundedPinPut({Key? key}) : super(key: key);

  @override
  State<FilledRoundedPinPut> createState() => _FilledRoundedPinPutState();

  @override
  String toStringShort() => 'Rounded Filled';
}

class _FilledRoundedPinPutState extends State<FilledRoundedPinPut> {
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
    const length = 5;
    const borderColor = Color.fromRGBO(169, 169, 169, 1);
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    // const fillColor = Color(0xffDEDEDE);
    const fillColor = Color.fromRGBO(255, 255, 255, 1);
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

    return SizedBox(
      height: 68,
      child: Observer(
        builder: (_) => Pinput(
          length: length,
          controller: controller,
          focusNode: focusNode,
          defaultPinTheme: defaultPinTheme,
          onCompleted: (pin) {
            _registrationStore.otpCode = int.parse(pin);
            // TODO: what type is better?

            //TODO: check if pin is correct
            // if pin is correct then go to next screen
            // here we can share error message if it's incorrect like this
            // setState(() => showError = pin != '5555');
            // here is logic where we make push request to server for checking pin
            // if pin is correct then we go to next screen

            Navigator.pushNamed(context, '/first_name_screen');
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
