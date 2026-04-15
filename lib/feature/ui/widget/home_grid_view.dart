import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_azkar/core/theming/colors.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({
    this.title,
    this.subtitle,
    this.icon,
    this.backgroundColor,
    this.onTap,
    super.key,
  });
  final Widget? title;
  final Widget? subtitle;
  final Color? backgroundColor;
  final Widget? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // height: 38.w,
                // width: 38.w,
                decoration: BoxDecoration(
                  color: ColorsManger.backgroundIcon,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: icon,
              ),
              ListTile(subtitle: subtitle, title: title),
            ],
          ),
        ),
      ),
    );
  }
}
