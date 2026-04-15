import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_azkar/core/helpers/padding.dart';
import 'package:quran_azkar/core/theming/colors.dart';
import 'package:quran_azkar/core/theming/text_styles.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_azkar/feature/ui/widget/prayer_time_widget.dart';
import 'package:quran_azkar/feature/ui/widget/return_five_grid_view.dart';
import 'package:quran_azkar/feature/ui/widget/return_two_grid_view.dart';

import '../../../generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final randomayah = quran.RandomVerse();
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).appTitle, style: TextStyles.font26BlackBold),
            Text(
              S.of(context).alBasmalah,
              style: TextStyles.font14BlackRegular,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              verticalSpace(18),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorsManger.darlkGreen,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 18,
                          backgroundColor: ColorsManger.lightGreen,
                          child: Icon(
                            Icons.menu_book_outlined,
                            color: Colors.white,
                          ),
                        ),
                        horizontalSpace(10),
                        Text(
                          S.of(context).ayahOfTheDay,
                          style: GoogleFonts.amiriQuran(
                            fontSize: 18,
                            height: 1.5,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      randomayah.verse,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.amiriQuran(
                        fontSize: 20,
                        height: 2,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${randomayah.translation} ',
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.ltr,
                      style: GoogleFonts.amiriQuran(
                        fontSize: 16,

                        color: Colors.white,
                      ),
                    ),
                    verticalSpace(6),
                    Text(
                      '${S.of(context).surah} ${quran.getSurahNameArabic(randomayah.surahNumber)}-${randomayah.verseNumber}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.amiriQuran(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(10),
              LayoutBuilder(
                builder: (context, constrained) {
                  if (constrained.maxWidth <= 600) {
                    return const ReturnTwoGridView();
                  } else {
                    return const ReturnFiveGridView();
                  }
                },
              ),
              const PrayerTimeWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
