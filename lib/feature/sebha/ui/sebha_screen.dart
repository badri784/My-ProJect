import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_azkar/feature/sebha/logic/cubit/counter_cubit.dart';
import 'package:quran_azkar/feature/sebha/logic/cubit/counter_state.dart';
import 'package:quran_azkar/feature/sebha/ui/widgets/azkar_dropdown.dart';
import 'package:quran_azkar/feature/sebha/ui/widgets/counter_button.dart';
import 'package:quran_azkar/feature/sebha/ui/widgets/reset_button.dart';

import 'package:quran_azkar/core/theming/colors.dart';
import 'package:quran_azkar/generated/l10n.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, counter) {
          return Scaffold(
            backgroundColor: isDarkMode
                ? ColorsManger.backgroundDark
                : ColorsManger.offWhite,
            appBar: AppBar(
              backgroundColor: isDarkMode
                  ? ColorsManger.backgroundDark
                  : ColorsManger.offWhite,
              title: Column(
                children: [
                  Text(S.of(context).sebha),
                  Text('${S.of(context).totalCount}: ${counter.totalCount}'),
                ],
              ),
              centerTitle: true,
            ),
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double screenWidth = constraints.maxWidth;
                  double screenHeight = constraints.maxHeight;
                  double buttonSize = screenWidth * 0.6 < screenHeight * 0.4
                      ? screenWidth * 0.6
                      : screenHeight * 0.4;
                  double fontSizeDropdown = screenWidth * 0.04;
                  double fontSizeButton = screenWidth * 0.1;
                  double paddingVertical = screenHeight * 0.05;
                  double paddingHorizontal = screenWidth * 0.05;
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: paddingVertical,
                      horizontal: paddingHorizontal,
                    ),
                    child: Column(
                      children: [
                        AzkarDropdown(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          fontSizeDropdown: fontSizeDropdown,
                          isDarkMode: isDarkMode,
                        ),
                        const Spacer(),
                        CounterButton(
                          buttonSize: buttonSize,
                          fontSizeButton: fontSizeButton,
                          isDarkMode: isDarkMode,
                        ),
                        const Spacer(),
                        ResetButton(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          isDarkMode: isDarkMode,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
