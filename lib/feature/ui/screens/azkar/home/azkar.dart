import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/extension.dart';
import '../../../../../core/helpers/padding.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../widget/card_widget.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.offWhite,
      appBar: AppBar(
        title: Text(S.of(context).azkar),
        centerTitle: true,
        backgroundColor: ColorsManger.offWhite,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12, left: 18, right: 18),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                S.of(context).startYourDayWithRemembranceOfGod,
                style: TextStyles.font18SemiBoldGreen,
              ),
            ),
            verticalSpace(7),
            CardWidget(
              decorationLeading: const BoxDecoration(),
              leading: const SizedBox.shrink(),
              decoration: BoxDecoration(
                color: ColorsManger.white,
                borderRadius: BorderRadius.circular(18),
              ),
              title: Text(
                S.of(context).morningRemembrance,
                style: TextStyles.font13MediumGreen,
              ),
              subtitle: Text(
                S.of(context).startYourDayWithRemembranceOfGod,
                style: TextStyles.font13MediumGreen,
              ),
              trailing: Container(
                height: 30.h,
                width: 35.w,
                decoration: BoxDecoration(
                  color: ColorsManger.yellowLightIcon,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.wb_sunny,
                  color: ColorsManger.yellow,
                  size: 22,
                ),
              ),
              onTap: () {
                context.pushnamed(Routes.morningAzkar);
              },
            ),
            verticalSpace(7),
            CardWidget(
              decorationLeading: const BoxDecoration(),
              leading: const SizedBox.shrink(),

              decoration: BoxDecoration(
                color: ColorsManger.white,
                borderRadius: BorderRadius.circular(18),
              ),
              title: Text(
                S.of(context).afterThePrayerRemembrance,
                style: TextStyles.font13MediumGreen,
              ),
              subtitle: Text(
                S.of(context).rememberGodAfterPrayer,
                style: TextStyles.font13MediumGreen,
              ),
              trailing: Container(
                height: 30.h,
                width: 35.w,
                decoration: BoxDecoration(
                  color: ColorsManger.backgroundIcon,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.mosque,
                  color: ColorsManger.yellowIcon,
                  size: 22,
                ),
              ),
              onTap: () {
                context.pushnamed(Routes.afterPrayerAzkar);
              },
            ),
            verticalSpace(7),
            CardWidget(
              decorationLeading: const BoxDecoration(),
              decoration: BoxDecoration(
                color: ColorsManger.white,
                borderRadius: BorderRadius.circular(18),
              ),
              title: Text(
                S.of(context).eveningRemembrance,
                style: TextStyles.font13MediumGreen,
              ),
              subtitle: Text(
                S.of(context).endYourDayWithRemembranceOfGod,
                style: TextStyles.font13MediumGreen,
              ),
              trailing: Container(
                height: 30.h,
                width: 35.w,
                decoration: BoxDecoration(
                  color: ColorsManger.backgroundYellowIcon,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.nights_stay,
                  color: ColorsManger.greenDark,
                  size: 22,
                ),
              ),
              onTap: () {
                context.pushnamed(Routes.eveningAzkar);
              },
              leading: const SizedBox.shrink(),
            ),
            verticalSpace(7),
            CardWidget(
              decorationLeading: const BoxDecoration(),
              leading: const SizedBox.shrink(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: ColorsManger.white,
              ),
              title: Text(
                S.of(context).sleepRemembrance,
                style: TextStyles.font13MediumGreen,
              ),
              subtitle: Text(
                S.of(context).sleepWhileRememberingGod,
                style: TextStyles.font13MediumGreen,
              ),
              trailing: Container(
                height: 30.h,
                width: 35.w,
                decoration: BoxDecoration(
                  color: ColorsManger.backgroundYellowIcon,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.bedtime,
                  color: ColorsManger.greenDark,
                  size: 22,
                ),
              ),
              onTap: () {
                context.pushnamed(Routes.slipping);
              },
            ),
            verticalSpace(20),
            Container(
              height: 75.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorsManger.greenLight.withOpacity(0.2),
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: ColorsManger.darlkGreen,
                      ),
                    ),
                    const Text('سورة الرعد - آية 28'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
