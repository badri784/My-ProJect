import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_azkar/core/theming/colors.dart';
import 'package:quran_azkar/core/theming/font_weght.dart';
import 'package:quran_azkar/feature/ui/screens/sebha/cubit/counter_cubit.dart';
import 'package:quran_azkar/feature/ui/screens/sebha/cubit/counter_state.dart';
import 'package:quran_azkar/generated/l10n.dart';

class AzkarDropdown extends StatelessWidget {
  const AzkarDropdown({
    required this.screenWidth,
    required this.screenHeight,
    required this.fontSizeDropdown,
    required this.isDarkMode,
    super.key,
  });

  final double screenWidth;
  final double screenHeight;
  final double fontSizeDropdown;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    final List<String> azkarList = [
      S.of(context).subhanAllah,
      S.of(context).alhamdulillah,
      S.of(context).allahuAkbar,
      S.of(context).laHawlaWaLaQuwwataIllaBillah,
      S.of(context).subhanAllahWaBihamdihSubhanAllahAlAzim,
      S.of(context).astaghfirullah,
      S.of(context).allahummaSalliAlaMuhammad,
    ];

    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, counter) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenHeight * 0.01,
          ),
          decoration: BoxDecoration(
            color: isDarkMode
                ? ColorsManger.white.withOpacity(0.09)
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
                          ? ColorsManger.white
                          : ColorsManger.black,
                      fontSize: fontSizeDropdown,
                      fontWeight: FontWeightManger.medium,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (int? newIndex) {
                if (newIndex != null) {
                  context.read<CounterCubit>().changeZikr(newIndex);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
