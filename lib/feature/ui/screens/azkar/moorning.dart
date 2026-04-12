import 'package:flutter/material.dart';
import 'package:quran_azkar/feature/ui/screens/azkar/widgets/display_zekr.dart';

class MorningScreen extends StatelessWidget {
  const MorningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DisplayZekr(
      title: 'اذكار الصباح',
      fileName: 'morning_azkar_data',
      jsonKey: 'morning',
    );
  }
}
