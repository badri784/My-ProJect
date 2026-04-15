import 'package:flutter/material.dart';
import 'package:quran_azkar/core/theming/font_weght.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/theming/colors.dart';
import '../../../../generated/l10n.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int count = 0;
  int totalCount = 0;
  int selectedIndex = 0;

  Future<void> savecount() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('count', count);
    await preferences.setInt('totalCount', totalCount);
  }

  Future<void> loadcount() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      count = preferences.getInt('count') ?? 0;
      totalCount = preferences.getInt('totalCount') ?? 0;
    });
  }

  void incrementCount() {
    setState(() {
      count++;
      totalCount++;
    });
    savecount();
  }

  @override
  void initState() {
    super.initState();
    loadcount();
  }

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

    return Scaffold(
      backgroundColor: ColorsManger.offWhite,
      appBar: AppBar(
        backgroundColor: ColorsManger.offWhite,
        title: Column(
          children: [
            Text(S.of(context).sebha),
            Text('${S.of(context).totalCount}: $totalCount'),
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
                      color: ColorsManger.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: ColorsManger.black.withOpacity(0.2),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        value: selectedIndex,
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
                                fontSize: fontSizeDropdown,
                                fontWeight: FontWeightManger.medium,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (int? newIndex) {
                          if (newIndex != null) {
                            setState(() {
                              selectedIndex = newIndex;
                              count = 0;
                            });
                            savecount();
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
                      color: ColorsManger.white,
                      shape: BoxShape.circle,
                    ),
                    child: TextButton(
                      onPressed: incrementCount,
                      child: Text(
                        count.toString(),
                        style: TextStyle(fontSize: fontSizeButton),
                      ),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
                    onLongPress: () {
                      setState(() {
                        count = 0;
                        totalCount = 0;
                      });
                      savecount();
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
                      backgroundColor: ColorsManger.white,
                      foregroundColor: ColorsManger.black,
                    ),
                    onPressed: () {
                      setState(() {
                        count = 0;
                      });
                      savecount();
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
  }
}
