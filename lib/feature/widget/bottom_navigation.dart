import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_azkar/core/theming/colors.dart';
import 'package:quran_azkar/feature/ui/screens/azkar/home/azkar.dart';
import 'package:quran_azkar/feature/ui/screens/home_screen.dart';
import 'package:quran_azkar/feature/ui/screens/quran/cubit/quran_cubit.dart';
import 'package:quran_azkar/feature/ui/screens/quran/screen/quran.dart';
import 'package:quran_azkar/feature/ui/screens/sebha/sebha.dart';
import 'package:quran_azkar/feature/ui/screens/settings/settings.dart';

import '../../generated/l10n.dart';

class BottonNavigation extends StatefulWidget {
  const BottonNavigation({super.key});

  @override
  State<BottonNavigation> createState() => _BottonNavigationState();
}

class _BottonNavigationState extends State<BottonNavigation> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const SebhaScreen(),
    const AzkarScreen(),
    BlocProvider(create: (context) => QuranCubit(), child: const QuranScreen()),
    const SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode
          ? ColorsManger.backgroundDark
          : ColorsManger.backgroundWhite,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: isDarkMode
            ? ColorsManger.white
            : ColorsManger.darlkGreen,
        showSelectedLabels: true,
        unselectedItemColor: isDarkMode
            ? ColorsManger.white
            : ColorsManger.blackWithOpacity70,
        backgroundColor: isDarkMode
            ? ColorsManger.backgroundDark
            : ColorsManger.backgroundWhite,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: isDarkMode ? ColorsManger.white : ColorsManger.black,
            ),

            label: S.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.adjust,
              color: isDarkMode ? ColorsManger.white : ColorsManger.black,
            ),
            label: S.of(context).sebha,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wb_sunny,
              color: isDarkMode ? ColorsManger.white : ColorsManger.black,
            ),
            label: S.of(context).azkar,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu_book_outlined,
              color: isDarkMode ? ColorsManger.white : ColorsManger.black,
            ),
            label: S.of(context).quran,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: isDarkMode ? ColorsManger.white : ColorsManger.black,
            ),
            label: S.of(context).settings,
          ),
        ],
      ),

      body: screens[currentIndex],
    );
  }
}
