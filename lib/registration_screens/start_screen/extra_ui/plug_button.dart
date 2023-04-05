import 'package:flutter/material.dart';
import 'package:internship_app/styling.dart';

class PlugButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const PlugButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 32,
      decoration: BoxDecoration(
        color: StylingFiguresColors.plugButtonBackground,
        borderRadius: BorderRadius.circular(32),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Container(
          //   just simple circle with no functionality 20*20
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: StylingFiguresColors.elipsesColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
