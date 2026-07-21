import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_azkar/feature/home/widget/prayer_time_error_widget.dart';
import 'package:quran_azkar/feature/home/widget/prayer_time_loading_widget.dart';
import 'package:quran_azkar/feature/home/logic/cubit/prayer_time_cubit.dart';
import 'package:quran_azkar/feature/home/logic/cubit/prayer_time_state.dart';
import 'next_prayer_gradient_box.dart';
import 'next_prayer_loaded_content.dart';

class ConrtainerOfNextPrayreBuilder extends StatelessWidget {
  const ConrtainerOfNextPrayreBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrayerTimeCubit()..getPrayerTimes(),
      child: BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
        builder: (context, state) {
          if (state is PrayerTimeLoading) {
            return const NextPrayerGradientBox(
              child: PrayerTimeLoadingWidget(text: 'loading prayer ...'),
            );
          }
          if (state is PrayerTimeError) {
            return PrayerTimeErrorWidget(message: state.message);
          }
          if (state is PrayerTimeLoaded) {
            final String nextPrayer = state.nextPrayerName;
            final DateTime? nextPrayerTime = state.nextPrayerTime;
            log(
              'nextPrayerTime in ConrtainerOfNextPrayreBuilder: $nextPrayerTime',
            );
            return NextPrayerGradientBox(
              child: NextPrayerLoadedContent(
                nextPrayer: nextPrayer,
                nextPrayerTime: nextPrayerTime,
              ),
            );
          } else {
            return const NextPrayerGradientBox(
              child: Center(child: Text('No prayer times found')),
            );
          }
        },
      ),
    );
  }
}
