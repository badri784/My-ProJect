import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';

class SwitchListTileWidget extends StatelessWidget {
  const SwitchListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: ColorsManger.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: false,
            onChanged: (value) {
              // TODO: Implement dark mode toggle functionality
            },
          ),

          SwitchListTile(
            title: const Text('Language'),
            value: false,
            onChanged: (value) {
              // TODO: Implement language toggle functionality
            },
          ),
        ],
      ),
    );
  }
}
