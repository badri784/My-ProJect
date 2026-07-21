import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:quran_azkar/core/helpers/padding.dart';
import 'package:quran_azkar/core/theming/colors.dart';
import 'package:quran_azkar/core/theming/font_weght.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_azkar/core/utils/responsive_helper.dart';
import 'package:quran_azkar/feature/quran/logic/cubit/quran_cubit.dart';
import 'package:quran_azkar/feature/quran/ui/widgets/list_view_widget.dart';
import 'package:quran_azkar/feature/quran/ui/widgets/search_text.dart';

import 'package:quran_azkar/generated/l10n.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? Colors.black : ColorsManger.backgroundWhite,
      appBar: AppBar(
        backgroundColor: isDark ? Colors.black : ColorsManger.backgroundWhite,
        title: Text(
          S.of(context).appTitle,
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontSize: 26.clampSp(),
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
