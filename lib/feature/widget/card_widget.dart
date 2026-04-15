import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theming/colors.dart';

class CardWidget extends StatelessWidget {
  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Decoration? decoration;
  final Decoration? decorationLeading;

  const CardWidget({
    super.key,
    this.decorationLeading,
    this.onTap,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.decoration,
  });
  @override
  Widget build(context) {
    return Card(
      child: Container(
        // height: 70.h,
        width: double.infinity,
        decoration:
            decoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(
                colors: [ColorsManger.greenDark, ColorsManger.greenLight],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
        child: Center(
          child: ListTile(
            onTap: onTap,
            title: title,
            subtitle: subtitle,
            trailing:
                trailing ??
                Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: ColorsManger.yellow,
                  size: 14.sp,
                ),
            leading: Container(
              // width: 45.w,
              // height: 45.h,
              decoration:
                  decorationLeading ??
                  BoxDecoration(
                    border: Border.all(
                      color: ColorsManger.yellow.withOpacity(0.3),
                      width: 2.w,
                    ),
                    shape: BoxShape.rectangle,
                    color: ColorsManger.greenLight,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
              child: leading,
            ),
          ),
        ),
      ),
    );
  }
}
