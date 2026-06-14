import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_azkar/core/theming/colors.dart';
import 'package:quran_azkar/feature/ui/screens/sebha/cubit/counter_cubit.dart';
import 'package:quran_azkar/generated/l10n.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({
    required this.screenWidth,
    required this.screenHeight,
    required this.isDarkMode,
    super.key,
  });

  final double screenWidth;
  final double screenHeight;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onLongPress: () {
        context.read<CounterCubit>().resetAll();
      },
      icon: Icon(
        Icons.refresh,
        color: isDarkMode
            ? ColorsManger.white
            : ColorsManger.black.withOpacity(0.7),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.06,
          vertical: screenHeight * 0.015,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: isDarkMode
            ? ColorsManger.white.withOpacity(0.09)
            : ColorsManger.white,
        foregroundColor: ColorsManger.black,
      ),
      onPressed: () {
        context.read<CounterCubit>().resetCount();
      },
      label: Text(
        S.of(context).reset,
        style: GoogleFonts.amiri(
          color: isDarkMode
              ? ColorsManger.white
              : ColorsManger.black.withOpacity(0.7),
          fontSize: 16,
        ),
      ),
    );
  }
}
