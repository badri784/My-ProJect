import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_azkar/core/helpers/extension.dart';
import 'package:quran_azkar/core/routing/routes.dart';
import 'package:quran_azkar/core/theming/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_azkar/feature/ui/screens/quran/cubit/quran_cubit.dart';
import 'package:quran_azkar/core/theming/font_weght.dart';
import 'package:quran_azkar/core/theming/text_styles.dart';
import 'package:quran_azkar/generated/l10n.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});
  bool isArabic() => Intl.getCurrentLocale() == 'ar';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        final filteredSurahs = state.filteredSurahs;
        return ListView.builder(
          itemCount: filteredSurahs.length,
          itemBuilder: (context, loopIndex) {
            final index = filteredSurahs[loopIndex] - 1;
            return Card(
              child: ListTile(
                horizontalTitleGap: 15,
                onTap: () {
                  context.pushnamed(Routes.surahScreen, arguments: index);
                },
                leading: Container(
                  height: 38.w,
                  width: 38.w,
                  decoration: BoxDecoration(
                    color: ColorsManger.backgroundGray,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: ColorsManger.darlkGreen,
                        fontSize: 15.sp,
                        fontWeight: FontWeightManger.semiBold,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  isArabic()
                      ? quran.getSurahNameArabic(index + 1)
                      : quran.getSurahNameEnglish(index + 1),
                  style: TextStyles.font19BlackSemiBold,
                ),
                subtitle: Text(quran.getSurahNameEnglish(index + 1)),
                trailing: Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Column(
                    children: [
                      Text(
                        '${quran.getVerseCount(index + 1).toString()} ${S.of(context).ayah}',
                      ),
                      Text(quran.getPlaceOfRevelation(index + 1)),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
