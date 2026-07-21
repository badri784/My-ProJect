import 'package:flutter/material.dart';

import 'package:quran_azkar/core/helpers/padding.dart';
import 'package:quran_azkar/core/theming/text_styles.dart';
import 'package:quran_azkar/generated/l10n.dart';

class OnBoardingText extends StatelessWidget {
  const OnBoardingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).welcome, style: TextStyles.font21BlackExtraBold),
        Text(
          S.of(context).textOneOnBoardingScreenOne,
          style: TextStyles.font17LightGreenSemiBold,
        ),
        verticalSpace(20),
        Text(
          S.of(context).textTwoOnBoardingScreenOne,
          textAlign: TextAlign.center,
          style: TextStyles.font15BlackRegular,
        ),
      ],
    );
  }
}
