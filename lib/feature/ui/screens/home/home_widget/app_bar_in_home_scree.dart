import 'package:flutter/material.dart';
import 'package:quran_azkar/core/theming/font_weght.dart';
import 'package:quran_azkar/core/theming/text_styles.dart';

import '../../../../../generated/l10n.dart';

class AppBarInHomeScreen extends StatelessWidget {
  const AppBarInHomeScreen({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).appTitle,
          style: isDark
              ? const TextStyle(
                  color: Color(0xff8AD7A7),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                )
              : TextStyles.font26BlackBold,
        ),
        Text(
          S.of(context).alBasmalah,
          style: isDark
              ? const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeightManger.regular,
                  color: Colors.white,
                )
              : TextStyles.font14BlackRegular,
        ),
      ],
    );
  }
}
