// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_azkar/core/theming/colors.dart';
import 'package:quran_azkar/core/theming/font_weght.dart';

class TextStyles {
  static TextStyle font21BlackExtraBold = TextStyle(
    fontSize: 21.sp,
    fontWeight: FontWeightManger.extraBold,
    color: ColorsManger.black,
  );

  static TextStyle font17LightGreenSemiBold = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeightManger.semiBold,
    color: ColorsManger.lightGreen,
  );

  static TextStyle font15BlackRegular = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightManger.regular,
    color: ColorsManger.black.withOpacity(0.7),
  );
  static TextStyle font26BlckBold = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeightManger.bold,
    color: ColorsManger.black,
  );
  static TextStyle font18YellowRegular = TextStyle(
    fontSize: 18.sp,
    color: ColorsManger.yellow,
    fontWeight: FontWeightManger.regular,
  );
  static TextStyle font14BlackRegular = GoogleFonts.almarai(
    fontSize: 14,
    fontWeight: FontWeightManger.regular,
    color: ColorsManger.black,
  );
  static TextStyle font26BlackBold = const TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle font19BlackSemiBold = GoogleFonts.amiriQuran(
    color: Colors.black,
    fontSize: 19.sp,
    fontWeight: FontWeightManger.semiBold,
  );
  static TextStyle font22SemiBoldGreen = GoogleFonts.almarai(
    fontSize: 22.sp,
    fontWeight: FontWeightManger.semiBold,
    color: ColorsManger.greenLight,
    letterSpacing: 0.5,
  );

  static TextStyle font18SemiBoldGreen = GoogleFonts.amiri(
    fontSize: 18.sp,
    fontWeight: FontWeightManger.semiBold,
    color: ColorsManger.greenDark,
  );
  static TextStyle font13MediumGreen = GoogleFonts.amiri(
    fontSize: 13.sp,
    fontWeight: FontWeightManger.medium,
    color: ColorsManger.greenDark,
  );
  static TextStyle font16SemiBoldGreenLight = GoogleFonts.amiri(
    fontSize: 16.sp,
    fontWeight: FontWeightManger.semiBold,
    color: ColorsManger.greenLight,
    height: 1.8,
  );
  static TextStyle font13MediumGreenLight = GoogleFonts.almarai(
    fontSize: 13.sp,
    fontWeight: FontWeightManger.medium,
    color: ColorsManger.greenLight,
  );
  static TextStyle font11MediumLightYelow = GoogleFonts.almarai(
    fontSize: 11.sp,
    fontWeight: FontWeightManger.medium,
    color: ColorsManger.yellowLight,
  );
  static TextStyle font18SemiBoldWhite = GoogleFonts.amiri(
    fontSize: 18.sp,
    fontWeight: FontWeightManger.semiBold,
    color: ColorsManger.white,
  );
  static TextStyle font15MediumWhite = GoogleFonts.almarai(
    fontSize: 15.sp,
    fontWeight: FontWeightManger.medium,
    color: ColorsManger.white,
  );
}
