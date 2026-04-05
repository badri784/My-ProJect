import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;

import '../../../../logic/cubit/all_surahs_cubit.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({super.key, required this.surahNameTitle});

  final int surahNameTitle;

  @override
  Widget build(BuildContext context) {
    final titleSurah = context.read<AllSurahsCubit>().getSurahNameArabic(
      surahNameTitle,
    );

    return Scaffold(
      appBar: AppBar(title: Text(titleSurah)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Text(
            List.generate(
              quran.getVerseCount(surahNameTitle),
              (int verse) => quran.getVerse(
                surahNameTitle,
                verse + 1,
                verseEndSymbol: true,
              ),
            ).join(' ').toString(),
            textAlign: TextAlign.justify,
            style: GoogleFonts.amiriQuran(height: 2, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
