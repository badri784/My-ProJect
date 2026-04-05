import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_azkar/core/theming/colors.dart';

import '../../../../../generated/l10n.dart';
// import 'package:quran/quran.dart' as quran;

class SearchText extends StatelessWidget {
  const SearchText({this.controller, this.onChanged, super.key});

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTapUpOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(color: ColorsManger.darlkGreen),
        ),
        prefixIcon: const Icon(Icons.search),
        hintText: S.of(context).searchSurahsName,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
      ),
      onChanged: onChanged,
    );
  }
}
