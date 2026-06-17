import 'package:flutter/material.dart';
import 'package:quran_azkar/core/helpers/extension.dart';
import 'package:quran_azkar/core/helpers/padding.dart';
import 'package:quran_azkar/core/routing/routes.dart';
import 'package:quran_azkar/core/theming/colors.dart';
import 'package:quran_azkar/feature/ui/screens/azkar/azkar_screen/azkar_screen_widget/azkar_card_item.dart';
import 'package:quran_azkar/generated/l10n.dart';

class ReturnFiveGridView extends StatelessWidget {
  const ReturnFiveGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        verticalSpace(7),
        AzkarCardItem(
          isDark: isDark,
          titleText: S.of(context).quran,
          subtitleText: '',
          icon: Icons.menu_book_outlined,
          iconColor: ColorsManger.lightGreen,
          onTap: () => context.pushnamed(Routes.quran),
        ),
        verticalSpace(7),
        AzkarCardItem(
          isDark: isDark,
          titleText: S.of(context).azkar,
          subtitleText: '',
          icon: Icons.sunny,
          iconColor: ColorsManger.yellow,
          onTap: () => context.pushnamed(Routes.azkar),
        ),
        verticalSpace(7),
        AzkarCardItem(
          isDark: isDark,
          titleText: S.of(context).sebha,
          subtitleText: '',
          icon: Icons.adjust,
          iconColor: ColorsManger.lightGreen,
          onTap: () => context.pushnamed(Routes.sebha),
        ),
        verticalSpace(7),
        AzkarCardItem(
          isDark: isDark,
          titleText: S.of(context).qiblaTitle,
          subtitleText: '',
          icon: Icons.explore,
          iconColor: ColorsManger.yellowIcon,
          onTap: () => context.pushnamed(Routes.qibla),
        ),
        verticalSpace(7),
        AzkarCardItem(
          isDark: isDark,
          titleText: 'احكام',
          subtitleText: '',
          icon: Icons.help_outline,
          iconColor: isDark ? Colors.white : ColorsManger.greenDark,
          onTap: () => context.pushnamed(Routes.ahkam),
        ),
      ],
    );
  }
}
