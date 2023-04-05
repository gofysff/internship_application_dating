import 'package:flutter/material.dart';

class IndicatorProgressBar extends StatelessWidget {
  const IndicatorProgressBar({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  final int currentStep;
  final int totalSteps;
  static const double heightOfProgressBar = 7;
  @override
  Widget build(BuildContext context) {
    double widthOfScreen = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: widthOfScreen * (currentStep / totalSteps),
          height: heightOfProgressBar,
          decoration: const BoxDecoration(
            color: Color(0xff8A8A8A),
            shape: BoxShape.rectangle,
          ),
        ),
        Container(
          width: widthOfScreen - widthOfScreen * (currentStep / totalSteps),
          height: heightOfProgressBar,
          decoration: const BoxDecoration(
            color: Color(0xffF0F0F0),
            shape: BoxShape.rectangle,
          ),
        ),
      ],
    );
  }
}
