import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quran_azkar/core/helpers/padding.dart';
import 'package:quran_azkar/core/theming/colors.dart';

import '../../../../logic/cubit/prayer_time_cubit.dart';
import '../../../../logic/cubit/prayer_time_state.dart';
import 'package:quran_azkar/generated/l10n.dart';

class PrayerTimeWidget extends StatelessWidget {
  const PrayerTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // bool isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocProvider(
      create: (context) => PrayerTimeCubit()..getPrayerTimes(),
      child: BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
        builder: (context, state) {
          if (state is PrayerTimeLoading) {
            return const Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: CircularProgressIndicator(
                  color: ColorsManger.lightGreen,
                ),
              ),
            );
          } else if (state is PrayerTimeError) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Column(
                children: [
                  const Icon(Icons.location_off, color: Colors.red, size: 30),
                  verticalSpace(10),
                  Builder(
                    builder: (context) {
                      String errorMessage = state.message;
                      if (errorMessage == 'Location services are disabled.') {
                        errorMessage = S.of(context).locationServicesDisabled;
                      } else if (errorMessage ==
                          'Location permissions are denied') {
                        errorMessage = S.of(context).locationPermissionsDenied;
                      } else if (errorMessage ==
                          'Location permissions are permanently denied, we cannot request permissions.') {
                        errorMessage = S
                            .of(context)
                            .locationPermissionsPermanentlyDenied;
                      }
                      return Text(
                        errorMessage,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red),
                      );
                    },
                  ),
                  verticalSpace(10),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PrayerTimeCubit>().getPrayerTimes();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade100,
                      foregroundColor: Colors.red.shade900,
                      elevation: 0,
                    ),
                    child: Text(S.of(context).retry),
                  ),
                ],
              ),
            );
          } else if (state is PrayerTimeLoaded) {
            return _buildPrayerTimesUI(context, state.prayerTimes);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildPrayerTimesUI(BuildContext context, PrayerTimes prayerTimes) {
    final nextPrayer = prayerTimes.nextPrayer();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).prayerTimes,
          style: GoogleFonts.amiriQuran(
            fontSize: 22,
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        verticalSpace(15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              _buildPrayerCard(
                S.of(context).fajr,
                prayerTimes.fajr,
                nextPrayer == Prayer.fajr,
                Icons.wb_twilight,
                isDark,
              ),
              _buildPrayerCard(
                S.of(context).sunrise,
                prayerTimes.sunrise,
                nextPrayer == Prayer.sunrise,
                Icons.wb_sunny_outlined,
                isDark,
              ),
              _buildPrayerCard(
                S.of(context).dhuhr,
                prayerTimes.dhuhr,
                nextPrayer == Prayer.dhuhr,
                Icons.sunny,
                isDark,
              ),
              _buildPrayerCard(
                S.of(context).asr,
                prayerTimes.asr,
                nextPrayer == Prayer.asr,
                Icons.wb_sunny,
                isDark,
              ),
              _buildPrayerCard(
                S.of(context).maghrib,
                prayerTimes.maghrib,
                nextPrayer == Prayer.maghrib,
                Icons.nights_stay_outlined,
                isDark,
              ),
              _buildPrayerCard(
                S.of(context).isha,
                prayerTimes.isha,
                nextPrayer == Prayer.isha,
                Icons.nights_stay,
                isDark,
              ),
            ],
          ),
        ),
        verticalSpace(16),
      ],
    );
  }

  Widget _buildPrayerCard(
    String name,
    DateTime time,
    bool isNext,
    IconData icon,
    bool isDark,
  ) {
    // Format the time as h:mm a
    final formattedTime = DateFormat('h:mm a').format(time);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withOpacity(0.1) : ColorsManger.lightGreen,
        borderRadius: BorderRadius.circular(14),
        border: isNext
            ? const Border(left: BorderSide(color: Colors.amber, width: 3))
            : null,
      ),
      child: Column(
        children: [
          Text(
            name,
            style: GoogleFonts.cairo(
              // using a common readable font here
              fontSize: 16,
              color: isNext ? Colors.white : Colors.white.withOpacity(0.7),
              fontWeight: isNext ? FontWeight.bold : FontWeight.w600,
            ),
          ),

          verticalSpace(8),
          Icon(
            icon,
            color: isNext ? Colors.white : Colors.white.withOpacity(0.7),
            size: 28,
          ),
          verticalSpace(4),
          Text(
            formattedTime,
            style: GoogleFonts.cairo(
              fontSize: 14,
              color: isNext ? Colors.white : Colors.white.withOpacity(0.7),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
