import 'package:flutter/material.dart';

import '../../../styling.dart';

class FeatureWidget extends StatelessWidget {
  const FeatureWidget({
    Key? key,
    required this.titleText,
    required this.descriptionText,
  }) : super(key: key);

  final String titleText;
  final String descriptionText;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          //   just simple circle with no functionality 20*20
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: StylingFiguresColors.elipsesColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titleText,
                softWrap: true,
                style: const TextStyle(
                  fontFamily: kMainFont,
                  fontSize: kButtonTextFontSize,
                  fontWeight: FontWeight.w700,
                  color: StylingFontsColors.mainTextColor,
                )),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              child: Text(descriptionText,
                  softWrap: true, style: kDescriptionTextStyle),
            ),
          ],
        ),
      ],
    );
  }
}
