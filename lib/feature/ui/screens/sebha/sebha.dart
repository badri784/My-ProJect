import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_azkar/core/theming/font_weght.dart';
import 'package:quran_azkar/feature/ui/screens/sebha/cubit/counter_cubit.dart';
import 'package:quran_azkar/feature/ui/screens/sebha/cubit/counter_state.dart';

import '../../../../core/theming/colors.dart';
import '../../../../generated/l10n.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final List<String> azkarList = [
      S.of(context).subhanAllah,
      S.of(context).alhamdulillah,
      S.of(context).allahuAkbar,
      S.of(context).laHawlaWaLaQuwwataIllaBillah,
      S.of(context).subhanAllahWaBihamdihSubhanAllahAlAzim,
      S.of(context).astaghfirullah,
      S.of(context).allahummaSalliAlaMuhammad,
    ];
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
                  double fontSizeButton = screenWidth * 0.06;
                  double paddingVertical = screenHeight * 0.05;
                  double paddingHorizontal = screenWidth * 0.05;
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: paddingVertical,
                      horizontal: paddingHorizontal,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.04,
                            vertical: screenHeight * 0.01,
                          ),
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? ColorsManger.white.withOpacity(0.7)
                                : ColorsManger.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: ColorsManger.black.withOpacity(0.2),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              value: counter.selectedIndex,
                              isExpanded: true,
                              icon: const Icon(Icons.arrow_drop_down),
                              items: azkarList.asMap().entries.map((entry) {
                                int index = entry.key;
                                String zikr = entry.value;
                                return DropdownMenuItem<int>(
                                  alignment: Alignment.center,
                                  enabled: true,
                                  value: index,
                                  child: Text(
                                    zikr,
                                    textAlign: TextAlign.justify,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: isDarkMode
                                          ? ColorsManger.black
                                          : ColorsManger.white,
                                      fontSize: fontSizeDropdown,
                                      fontWeight: FontWeightManger.medium,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (int? newIndex) {
                                if (newIndex != null) {
                                  context.read<CounterCubit>().changeZikr(
                                    newIndex,
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: buttonSize,
                          height: buttonSize,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: ColorsManger.black.withOpacity(0.2),
                            ),
                            color: isDarkMode
                                ? ColorsManger.white.withOpacity(0.7)
                                : ColorsManger.white,
                            shape: BoxShape.circle,
                          ),
                          child: TextButton(
                            onPressed: () {
                              context.read<CounterCubit>().incrementCounter();
                            },
                            child: Text(
                              counter.count.toString(),
                              style: TextStyle(
                                fontSize: fontSizeButton,
                                color: isDarkMode
                                    ? ColorsManger.black
                                    : ColorsManger.white,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton.icon(
                          onLongPress: () {
                            context.read<CounterCubit>().resetAll();
                          },
                          icon: const Icon(Icons.refresh),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.06,
                              vertical: screenHeight * 0.015,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: isDarkMode
                                ? ColorsManger.white.withOpacity(0.7)
                                : ColorsManger.white,
                            foregroundColor: ColorsManger.black,
                          ),
                          onPressed: () {
                            context.read<CounterCubit>().resetCount();
                          },
                          label: Text(S.of(context).reset),
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
