import 'package:flutter/material.dart';
import 'package:quran_azkar/core/theming/text_styles.dart';

class AzkarHeader extends StatelessWidget {
  const AzkarHeader({
    super.key,
    required this.isDark,
    required this.text,
  });

  final bool isDark;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Text(
        text,
        style: isDark
            ? TextStyles.font18SemiBoldWhite
            : TextStyles.font18SemiBoldGreen,
      ),
    );
  }
}
