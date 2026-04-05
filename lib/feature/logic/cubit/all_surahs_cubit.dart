import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/quran.dart' as quran;
part 'all_surahs_state.dart';

class AllSurahsCubit extends Cubit<AllSurahsState> {
  AllSurahsCubit() : super(AllSurahsInitial());

  String getSurahNameArabic(int index) {
    emit(AllSurahsLoading());
    try {
      final surahs = quran.getSurahNameArabic(index + 1);
      emit(AllSurahsTitleLoaded(surah: surahs));
      return surahs;
    } catch (e) {
      emit(AllSurahsError(message: e.toString()));
      return '';
    }
  }

  // String getAllVerses(int indexSurah) {
  //   emit(AllSurahsLoading());
  //   try {
  //     String allVerses = '';
  //     int surahNumber = indexSurah + 1;
  //     for (int i = 1; i <= quran.getVerseCount(surahNumber); i++) {
  //       allVerses += quran.getVerse(surahNumber, i, verseEndSymbol: true);
  //     }
  //     emit(AllSurahsVersesLoaded(verses: allVerses));
  //     return allVerses;
  //   } catch (e) {
  //     emit(AllSurahsError(message: e.toString()));
  //     return '';
  //   }
  // }
}
