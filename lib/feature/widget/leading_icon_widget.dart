import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_azkar/core/theming/colors.dart';

class LeadingIconWidget extends StatelessWidget {
  const LeadingIconWidget({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.w,
      width: 38.w,
      decoration: BoxDecoration(
        color: ColorsManger.backgroundGray,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: child,
    );
  }
}
