import 'package:adhan/adhan.dart';

abstract class PrayerTimeState {}

class PrayerTimeInitial extends PrayerTimeState {}

class PrayerTimeLoading extends PrayerTimeState {}

class PrayerTimeLoaded extends PrayerTimeState {
  final PrayerTimes prayerTimes;
  final String nextPrayerName;
  final DateTime? nextPrayerTime;

  PrayerTimeLoaded(
    this.prayerTimes, {
    required this.nextPrayerName,
    required this.nextPrayerTime,
  });
}

class PrayerTimeError extends PrayerTimeState {
  final String message;

  PrayerTimeError(this.message);
}
