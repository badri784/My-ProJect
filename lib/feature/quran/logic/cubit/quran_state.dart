part of 'quran_cubit.dart';

class QuranState {
  final String searchQuery;
  final List<int> filteredSurahs;

  QuranState({
    required this.searchQuery,
    required this.filteredSurahs,
  });
}
