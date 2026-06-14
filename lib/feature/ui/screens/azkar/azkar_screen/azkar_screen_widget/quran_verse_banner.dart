import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_azkar/core/theming/colors.dart';

class QuranVerseBanner extends StatelessWidget {
  const QuranVerseBanner({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                color: isDark
                    ? ColorsManger.white
                    : ColorsManger.darlkGreen,
              ),
            ),
            const Text(
              'سورة الرعد - آية 28',
              style: TextStyle(color: ColorsManger.white),
            ),
          ],
        ),
      ),
    );
  }
}
