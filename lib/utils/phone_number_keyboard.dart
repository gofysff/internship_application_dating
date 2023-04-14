// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flag/flag.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internship_app/registration_store/registration_store.dart';

import 'package:masked_text_field/masked_text_field.dart';
import 'package:internship_app/styling.dart';
import 'package:provider/provider.dart';

import '../registration_screens/phone_number_screen/res.dart';

class PhoneNumberKeyboardWidget extends StatefulWidget {
  final double widthOfScreen;
  final Widget buttonToNextScreen;

  const PhoneNumberKeyboardWidget({
    Key? key,
    required this.widthOfScreen,
    required this.buttonToNextScreen,
  }) : super(key: key);

  @override
  State<PhoneNumberKeyboardWidget> createState() =>
      _PhoneNumberKeyboardWidgetState();
}

class _PhoneNumberKeyboardWidgetState extends State<PhoneNumberKeyboardWidget> {
  final _phoneTextController = TextEditingController();

  RegistrationStore? _registrationStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _registrationStore ??= Provider.of<RegistrationStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return keyboardWithButtonToNextScreen;
  }

  // next will be splitted into small parts describing of keyboard
  Widget get keyboardWithButtonToNextScreen => Observer(
        builder: (_) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              PhoneNumberScreenRes.textAboveButtonToKeyboard,
              style: StylingTypicalTextStyles.descriptionTextStyle,
            ),
            completeWrappedKeyboard,
            const SizedBox(height: 16),
            widget.buttonToNextScreen,
          ],
        ),
      );

  Widget get completeWrappedKeyboard => Container(
        decoration: BoxDecoration(
          color: StylingOtherColors.textFieldBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          border:
              Border.all(color: StylingOtherColors.borderAroundTextFieldColor),
        ),
        child: completeKeyboardWithoutWraping,
      );

  Widget get completeKeyboardWithoutWraping => Row(
        children: [
          const SizedBox(width: 12),
          Flag.fromCode(FlagsCode.RU, height: 24, width: 24),
          const SizedBox(width: 8),
          Text(
            _registrationStore!.countryNumber,
            style: StylingTypicalTextStyles.descriptionTextStyle,
          ),
          const SizedBox(width: 30),
          keyboardField,
        ],
      );

  // part of keyboard only where we can input number
  Widget get keyboardField => SizedBox(
        width: widget.widthOfScreen - 106 - 16 * 2,
        // width limitation because of Row
        child: MaskedTextField(
          mask: PhoneNumberScreenRes.maskTextField,
          textFieldController: _phoneTextController,
          maxLength: PhoneNumberScreenRes.correctPhoneNumberLength,
          onChange: (String inputString) {
            _registrationStore!.phoneNumber = inputString;
          },
          inputDecoration: const InputDecoration(
            focusColor: Colors.black,
            counterText: "",
          ),
          keyboardType: TextInputType.phone,
        ),
      );
}
