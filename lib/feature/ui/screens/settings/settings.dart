import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_azkar/core/helpers/padding.dart';
import 'package:quran_azkar/core/theming/colors.dart';
import 'package:quran_azkar/core/theming/text_styles.dart';
import 'package:quran_azkar/feature/ui/screens/settings/widget/about_application_listtile.dart';
import 'package:quran_azkar/feature/ui/screens/settings/widget/switch_list_tile_widget.dart';

import '../../../../generated/l10n.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.backgroundWhite,
      appBar: AppBar(
        backgroundColor: ColorsManger.backgroundWhite,
        title: Text(S.of(context).settings, style: TextStyles.font26BlackBold),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 10.h, right: 15.w, left: 15.w),
          child: Column(
            children: [
              const SwitchListTileWidget(),
              verticalSpace(12.h),

              const AboutApplicationListTile(),
            ],
          ),
        ),
      ),
    );
  }
}
