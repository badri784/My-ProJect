import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_azkar/core/theming/font_weght.dart';

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

  @override
  Widget build(BuildContext context) {
    final List<String> azkarList = [
      S.of(context).subhanAllah,
      S.of(context).alhamdulillah,
      S.of(context).allahuAkbar,
      S.of(context).laIlahaIllaAllah,
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
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: ColorsManger.white,
                  borderRadius: BorderRadius.circular(12.r),
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
                        value: index,
                        child: Text(
                          zikr,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18.sp,

                            fontWeight: FontWeightManger.semiBold,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (int? newIndex) {
                      if (newIndex != null) {
                        setState(() {
                          selectedIndex = newIndex;
                        });
                      }
                    },
                  ),
                ),
              ),
              Container(
                height: 200.w,
                width: 200.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.w,
                    color: ColorsManger.black.withOpacity(0.2),
                  ),
                  color: ColorsManger.white,
                  shape: BoxShape.circle,
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      totalCount++;
                      count++;
                    });
                  },
                  child: Text(
                    count.toString(),
                    style: TextStyle(fontSize: 22.sp),
                  ),
                ),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.refresh),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 12.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  backgroundColor: ColorsManger.white,
                  foregroundColor: ColorsManger.black,
                ),
                onPressed: () {
                  setState(() {
                    count = 0;
                  });
                },
                label: Text(S.of(context).reset),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
