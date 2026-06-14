import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_azkar/core/helpers/padding.dart';
import 'package:quran_azkar/core/theming/colors.dart';
import 'package:quran_azkar/generated/l10n.dart';

class ContainerInHomeScreen extends StatelessWidget {
  const ContainerInHomeScreen({super.key, required this.randomayah});

  final quran.RandomVerse randomayah;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorsManger.darlkGreen,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundColor: ColorsManger.lightGreen,
                child: Icon(Icons.menu_book_outlined, color: Colors.white),
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
            style: GoogleFonts.amiriQuran(fontSize: 16, color: Colors.white),
          ),
          verticalSpace(6),
          Text(
            '${S.of(context).surah} ${quran.getSurahNameArabic(randomayah.surahNumber)}-${randomayah.verseNumber}',
            textAlign: TextAlign.center,
            style: GoogleFonts.amiriQuran(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
