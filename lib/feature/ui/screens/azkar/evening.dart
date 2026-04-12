import 'package:flutter/material.dart';
import 'package:quran_azkar/feature/ui/screens/azkar/widgets/display_zekr.dart';

class EveningScreen extends StatelessWidget {
  const EveningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DisplayZekr(
      title: 'اذكار المساء',
      fileName: 'evening_azkar',
      jsonKey: 'evening_azkar',
    );
  }
}
