import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_azkar/core/helpers/padding.dart';
import 'package:quran_azkar/core/theming/colors.dart';
import 'package:quran_azkar/core/theming/font_weght.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_azkar/feature/ui/screens/quran/cubit/quran_cubit.dart';
import 'package:quran_azkar/feature/ui/screens/quran/widget/list_view_widget.dart';
import 'package:quran_azkar/feature/ui/screens/quran/widget/search_text.dart';

import '../../../../../generated/l10n.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.backgroundWhite,
      appBar: AppBar(
        backgroundColor: ColorsManger.backgroundWhite,
        title: Text(
          S.of(context).appTitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: 26.sp,
            fontWeight: FontWeightManger.extraBold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 10.h,
          bottom: 10.h,
          left: 12.w,
          right: 12.w,
        ),
        child: Column(
          children: [
            SearchText(
              onChanged: (value) {
                context.read<QuranCubit>().search(value);
              },
            ),
            verticalSpace(10),
            const Expanded(child: ListViewWidget()),
          ],
        ),
      ),
    );
  }
}
