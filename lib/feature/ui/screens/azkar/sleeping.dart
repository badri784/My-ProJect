import 'package:flutter/material.dart';
import 'package:quran_azkar/feature/ui/screens/azkar/widgets/display_zekr.dart';

class SlippingScreen extends StatelessWidget {
  const SlippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DisplayZekr(
      title: 'اذكار النوم',
      fileName: 'sleeping_azkar',
      jsonKey: 'sleeping_azkar',
    );
  }
}
