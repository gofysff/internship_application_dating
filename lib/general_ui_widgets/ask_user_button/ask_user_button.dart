import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../styling.dart';
import 'ask_user_button_store/ask_user_button_store.dart';

AskUserButtonStore _askUserButtonStore = AskUserButtonStore();

class AskUserButton extends StatefulWidget {
  const AskUserButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  bool get isPressed => _askUserButtonStore.isPressed;

  final String text;
  @override
  State<AskUserButton> createState() => _AskUserButtonState();
}

class _AskUserButtonState extends State<AskUserButton> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => TextButton(
        onPressed: () {
          _askUserButtonStore.changeIsPressed();
        },
        child: Row(
          children: [
            _askUserButtonStore.isPressed
                ? const Icon(
                    Icons.check,
                    color: Colors.black,
                    size: 24,
                    fill: 0.1,
                  )
                : const Icon(Icons.check_box_outline_blank,
                    color: StylingFontsColors.fadedColor),
            const SizedBox(width: 16),
            Text(
              widget.text,
              style: _askUserButtonStore.isPressed
                  ? StylingTypicalTextStyles.descriptionTextStyleFaded
                  : StylingTypicalTextStyles.descriptionTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
