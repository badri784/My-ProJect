import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_azkar/core/helpers/extension.dart';
import 'package:quran_azkar/feature/widget/leading_icon_widget.dart';
import 'package:quran_azkar/feature/widget/list_tile_widget.dart';
import 'package:quran_azkar/generated/l10n.dart';

import '../../../../../core/helpers/padding.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/font_weght.dart';

class AboutApplicationListTile extends StatelessWidget {
  const AboutApplicationListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          S.of(context).aboutApp,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeightManger.semiBold,
            color: ColorsManger.darkGrayTextSettings,
          ),
        ),
        verticalSpace(10),
        Container(
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            color: ColorsManger.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            children: [
              ListTileWidget(
                title: Text(S.of(context).aboutApp),
                leading: const LeadingIconWidget(
                  child: Center(
                    child: Icon(Icons.error, color: ColorsManger.lightGreen),
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                ontap: () {
                  context.pushnamed(Routes.about);
                },
              ),
              verticalSpace(10),
              ListTileWidget(
                ontap: () {
                  context.pushnamed(Routes.privacyPolicy);
                },
                title: Text(S.of(context).privacyPolicy),
                leading: const LeadingIconWidget(
                  child: Center(
                    child: Icon(
                      Icons.privacy_tip,
                      color: ColorsManger.darlkGreen,
                    ),
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 15),
              ),
              verticalSpace(10),
              ListTileWidget(
                ontap: () {
                  context.pushnamed(Routes.termsAndConditions);
                },
                title: Text(S.of(context).termsAndConditions),
                leading: const LeadingIconWidget(
                  child: Center(
                    child: Icon(
                      Icons.description,
                      color: ColorsManger.lightGreen,
                    ),
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 15),
              ),
              verticalSpace(10),
              ListTileWidget(
                ontap: () {
                  context.pushnamed(Routes.contactUs);
                },
                title: Text(S.of(context).contactUs),
                leading: const LeadingIconWidget(
                  child: Center(
                    child: Icon(Icons.message, color: ColorsManger.darlkGreen),
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
