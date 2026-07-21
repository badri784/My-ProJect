import 'package:flutter/material.dart';
import 'alarm_active.dart';
import 'next_prayer.dart';
import 'prayer_at.dart';
import 'timer_for_next_prayer.dart';

/// The content displayed inside the gradient container when prayer times are loaded.
class NextPrayerLoadedContent extends StatelessWidget {
  const NextPrayerLoadedContent({
    super.key,
    required this.nextPrayer,
    required this.nextPrayerTime,
  });

  final String nextPrayer;
  final DateTime? nextPrayerTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        NextPrayerWidget(nextPrayer: nextPrayer),
        const Spacer(),
        TimerForNextPrayer(nextPrayerTime: nextPrayerTime),
        const Spacer(),
        PrayerAtTime(
          nextPrayerTimes: nextPrayerTime,
          nextPrayer: nextPrayer,
        ),
        const Spacer(),
        const AlarmActive(),
        const Spacer(),
      ],
    );
  }
}
