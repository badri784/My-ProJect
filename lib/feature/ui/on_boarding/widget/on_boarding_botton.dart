import 'package:flutter/material.dart';
import 'package:quran_azkar/core/theming/colors.dart';

class OnBoardingBotton extends StatelessWidget {
  const OnBoardingBotton({
    this.buttonStyle,
    this.text,
    this.onPressed,
    super.key,
  });

  final Widget? text;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 26, right: 26),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: ColorsManger.darlkGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: text,
        ),
      ),
    );
  }
}
