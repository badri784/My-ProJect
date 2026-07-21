import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/quran.dart' as quran;

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit()
    : super(
        QuranState(
          searchQuery: '',
          filteredSurahs: List.generate(
            quran.totalSurahCount,
            (index) => index + 1,
          ),
        ),
      );

  String _normalizeArabic(String text) {
    return text
        .replaceAll(RegExp(r'[\u064B-\u065F]'), '') // Remove harakat
        .replaceAll(RegExp(r'[إأآا]'), 'ا') // Normalize alef
        .replaceAll('ة', 'ه') // Normalize taa marbuta
        .replaceAll('ي', 'ى'); // Normalize yaa
  }

  void search(String query) {
    if (query.isEmpty) {
      emit(
        QuranState(
          searchQuery: '',
          filteredSurahs: List.generate(
            quran.totalSurahCount,
            (index) => index + 1,
          ),
        ),
      );
      return;
    }

    final normalizedQuery = _normalizeArabic(query);
    List<int> filtered = [];

    for (int i = 1; i <= quran.totalSurahCount; i++) {
      final nameArabic = quran.getSurahNameArabic(i);
      if (_normalizeArabic(nameArabic).contains(normalizedQuery)) {
        filtered.add(i);
      }
    }

    emit(QuranState(searchQuery: query, filteredSurahs: filtered));
  }

  void surah(int surahNumber) {}
}
