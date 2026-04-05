part of 'all_surahs_cubit.dart';

@immutable
sealed class AllSurahsState {}

final class AllSurahsInitial extends AllSurahsState {}

final class AllSurahsLoading extends AllSurahsState {}

final class AllSurahsTitleLoaded extends AllSurahsState {
  final String? surah;
  AllSurahsTitleLoaded({this.surah});
}

final class AllSurahsVersesLoaded extends AllSurahsState {
  final String? verses;
  AllSurahsVersesLoaded({this.verses});
}

final class AllSurahsError extends AllSurahsState {
  final String message;
  AllSurahsError({required this.message});
}
