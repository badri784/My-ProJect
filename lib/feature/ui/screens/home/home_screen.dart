import 'package:flutter/material.dart';
import 'package:quran_azkar/core/helpers/padding.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_azkar/feature/ui/screens/home/home_widget/app_bar_in_home_scree.dart';
import 'package:quran_azkar/feature/ui/screens/home/home_widget/container_in_home_screen.dart';
import 'package:quran_azkar/feature/ui/screens/home/home_widget/prayer_time_widget.dart';
import 'package:quran_azkar/feature/ui/screens/home/home_widget/return_five_grid_view.dart';
import 'package:quran_azkar/feature/ui/screens/home/home_widget/return_two_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final randomayah = quran.RandomVerse();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: AppBarInHomeScreen(isDark: isDark)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              verticalSpace(18),
              ContainerInHomeScreen(randomayah: randomayah),
              verticalSpace(10),
              const PrayerTimeWidget(),
              LayoutBuilder(
                builder: (context, constrained) {
                  if (constrained.maxWidth <= 600) {
                    return const ReturnTwoGridView();
                  } else {
                    return const ReturnFiveGridView();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
