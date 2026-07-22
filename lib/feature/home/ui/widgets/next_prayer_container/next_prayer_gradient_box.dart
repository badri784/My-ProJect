import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:quran_azkar/core/theming/colors.dart';

/// Reusable gradient container used across prayer states (loading, loaded, fallback).
class NextPrayerGradientBox extends StatelessWidget {
  const NextPrayerGradientBox({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: min(250.h, 300),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: ColorsManger.greenDark,
        // gradient: const LinearGradient(
        //   colors: [
        //     Color(0xff0d0f2f),
        //     Color(0xff0f1134),
        //     Color(0xff101239),
        //     Color(0xff12133e),
        //     Color(0xff101239),
        //     Color(0xff0f1134),
        //     Color(0xff0d0f2f),
        //   ],
        //   stops: [0.0, 0.15, 0.35, 0.5, 0.65, 0.85, 1.0],
        //   begin: Alignment.bottomRight,
        //   end: Alignment.topLeft,
        // ),
      ),
      child: child,
    );
  }
}
