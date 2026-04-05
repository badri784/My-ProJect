import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_azkar/core/helpers/extension.dart';
import 'package:quran_azkar/core/helpers/padding.dart';
import 'package:quran_azkar/core/routing/routes.dart';
import 'package:quran_azkar/core/theming/colors.dart';
import 'package:quran_azkar/core/theming/text_styles.dart';
import 'package:quran_azkar/feature/ui/on_boarding/widget/on_boarding_botton.dart';
import 'package:quran_azkar/generated/l10n.dart';

class OnBordingScrennTwo extends StatelessWidget {
  const OnBordingScrennTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.backgroundWhite,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 115.h,
                      width: 115.w,
                      decoration: BoxDecoration(
                        color: ColorsManger.backgroundYellow,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Icon(
                        Icons.sunny,
                        color: ColorsManger.yellow,
                        size: 60.sp,
                      ),
                    ),
                    verticalSpace(30),
                    Text('مميزات التطبيق', style: TextStyles.font26BlckBold),
                    Text(
                      S.of(context).evrrythingYouNeedInOnePlace,
                      style: TextStyles.font18YellowRegular,
                    ),
                    verticalSpace(12),
                    Text(
                      S.of(context).textThreeOnBoardingScreenTwo,
                      textAlign: TextAlign.center,
                      style: TextStyles.font15BlackRegular,
                    ),
                  ],
                ),
              ),
            ),

            /// الزرار تحت
            OnBoardingBotton(
              onPressed: () {
                context.pushReplacementName(Routes.onBoardingThree);
              },
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.arrow_back, color: ColorsManger.white),
                  horizontalSpace(7),
                  Text(
                    S.of(context).next,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
