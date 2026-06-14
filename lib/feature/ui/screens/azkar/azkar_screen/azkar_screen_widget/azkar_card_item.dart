import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_azkar/core/theming/colors.dart';
import 'package:quran_azkar/core/theming/font_weght.dart';
import 'package:quran_azkar/core/theming/text_styles.dart';
import 'package:quran_azkar/feature/widget/card_widget.dart';

class AzkarCardItem extends StatelessWidget {
  const AzkarCardItem({
    super.key,
    required this.isDark,
    required this.titleText,
    required this.subtitleText,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });

  final bool isDark;
  final String titleText;
  final String subtitleText;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      decorationLeading: const BoxDecoration(),
      leading: const SizedBox.shrink(),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withOpacity(0.09)
            : ColorsManger.white,
        borderRadius: BorderRadius.circular(18),
      ),
      title: Text(
        titleText,
        style: isDark
            ? const TextStyle(
                color: ColorsManger.white,
                fontSize: 16,
                fontWeight: FontWeightManger.medium,
              )
            : TextStyles.font13MediumGreen,
      ),
      subtitle: Text(
        subtitleText,
        style: isDark
            ? const TextStyle(
                color: ColorsManger.white,
                fontSize: 16,
                fontWeight: FontWeightManger.medium,
              )
            : TextStyles.font13MediumGreen,
      ),
      trailing: Container(
        height: 30.h,
        width: 35.w,
        decoration: BoxDecoration(
          color: isDark
              ? ColorsManger.white.withOpacity(0.09)
              : ColorsManger.backgroundYellowIcon,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 22,
        ),
      ),
      onTap: onTap,
    );
  }
}
