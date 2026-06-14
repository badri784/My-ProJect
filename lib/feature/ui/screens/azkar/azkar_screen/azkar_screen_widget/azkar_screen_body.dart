import 'package:flutter/material.dart';
import 'package:quran_azkar/core/helpers/extension.dart';
import 'package:quran_azkar/core/helpers/padding.dart';
import 'package:quran_azkar/core/routing/routes.dart';
import 'package:quran_azkar/core/theming/colors.dart';
import 'package:quran_azkar/feature/ui/screens/azkar/azkar_screen/azkar_screen_widget/azkar_card_item.dart';
import 'package:quran_azkar/feature/ui/screens/azkar/azkar_screen/azkar_screen_widget/azkar_header.dart';
import 'package:quran_azkar/feature/ui/screens/azkar/azkar_screen/azkar_screen_widget/quran_verse_banner.dart';
import 'package:quran_azkar/generated/l10n.dart';

class AzkarScreenBody extends StatelessWidget {
  const AzkarScreenBody({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 12, left: 18, right: 18),
        child: Column(
          children: [
            AzkarHeader(
              isDark: isDark,
              text: S.of(context).startYourDayWithRemembranceOfGod,
            ),
            verticalSpace(7),
            AzkarCardItem(
              isDark: isDark,
              titleText: S.of(context).morningRemembrance,
              subtitleText: S.of(context).startYourDayWithRemembranceOfGod,
              icon: Icons.wb_sunny,
              iconColor: ColorsManger.yellow,
              onTap: () => context.pushnamed(Routes.morningAzkar),
            ),
            verticalSpace(7),
            AzkarCardItem(
              isDark: isDark,
              titleText: S.of(context).afterThePrayerRemembrance,
              subtitleText: S.of(context).rememberGodAfterPrayer,
              icon: Icons.mosque,
              iconColor: ColorsManger.yellowIcon,
              onTap: () => context.pushnamed(Routes.afterPrayerAzkar),
            ),
            verticalSpace(7),
            AzkarCardItem(
              isDark: isDark,
              titleText: S.of(context).eveningRemembrance,
              subtitleText: S.of(context).endYourDayWithRemembranceOfGod,
              icon: Icons.nights_stay,
              iconColor: isDark ? Colors.white : ColorsManger.greenDark,
              onTap: () => context.pushnamed(Routes.eveningAzkar),
            ),
            verticalSpace(7),
            AzkarCardItem(
              isDark: isDark,
              titleText: S.of(context).sleepRemembrance,
              subtitleText: S.of(context).sleepWhileRememberingGod,
              icon: Icons.bedtime,
              iconColor: isDark ? Colors.white : ColorsManger.greenDark,
              onTap: () => context.pushnamed(Routes.slipping),
            ),
            verticalSpace(20),
            QuranVerseBanner(isDark: isDark),
          ],
        ),
      ),
    );
  }
}
