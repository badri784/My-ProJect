import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_azkar/core/theming/colors.dart';
import 'package:quran_azkar/feature/sebha/logic/cubit/counter_cubit.dart';
import 'package:quran_azkar/feature/sebha/logic/cubit/counter_state.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({
    required this.buttonSize,
    required this.fontSizeButton,
    required this.isDarkMode,
    super.key,
  });

  final double buttonSize;
  final double fontSizeButton;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, counter) {
        return Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: ColorsManger.yellow.withOpacity(0.5),
            ),
            color: isDarkMode
                ? ColorsManger.white.withOpacity(0.09)
                : ColorsManger.white,
            shape: BoxShape.circle,
          ),
          child: Container(
            width: buttonSize,
            height: buttonSize,
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.5,
                color: ColorsManger.yellow.withOpacity(0.8),
              ),
              color: isDarkMode
                  ? ColorsManger.white.withOpacity(0.09)
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
                      ? const Color(0xffF2BF4A)
                      : ColorsManger.black.withOpacity(0.7),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
