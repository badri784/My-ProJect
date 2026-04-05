import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_azkar/core/helpers/padding.dart';

import '../../../../core/helpers/extension.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/font_weght.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).privacyPolicy)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).privacyPolicyLastUpdate),
              Text(
                S.of(context).privacyPolicyIntroductionTitle,
                style: TextStyles.font19BlackSemiBold,
              ),
              ListTile(
                subtitle: Text(
                  S.of(context).privacyPolicyIntroductionBody,
                  style: TextStyle(fontSize: 14.sp),
                  textAlign: TextAlign.justify,
                ),
              ),
              // ignore: prefer_const_constructors
              ListTile(
                title: Text(
                  S.of(context).privacyPolicyDataCollectionTitle,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeightManger.bold,
                  ),
                ),
                subtitle: Text(
                  S.of(context).privacyPolicyDataCollectionBody,
                  style: TextStyle(fontSize: 14.sp),
                  textAlign: TextAlign.justify,
                ),
              ),
              ListTile(
                title: Text(
                  S.of(context).privacyPolicyDataUsageTitle,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeightManger.bold,
                  ),
                ),
                subtitle: Text(
                  S.of(context).privacyPolicyDataUsageBody,
                  style: TextStyle(fontSize: 14.sp),
                  textAlign: TextAlign.justify,
                ),
              ),
              ListTile(
                title: Text(
                  S.of(context).privacyPolicyDataProtectionTitle,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeightManger.bold,
                  ),
                ),
                subtitle: Text(
                  S.of(context).privacyPolicyDataProtectionBody,
                  style: TextStyle(fontSize: 14.sp),
                  textAlign: TextAlign.justify,
                ),
              ),
              ListTile(
                title: Text(
                  S.of(context).privacyPolicyRightsTitle,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeightManger.bold,
                  ),
                ),
                subtitle: Text(
                  S.of(context).privacyPolicyRightsBody,
                  style: TextStyle(fontSize: 14.sp),
                  textAlign: TextAlign.justify,
                ),
              ),
              verticalSpace(70.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: S.of(context).privacyPolicyContactTitle,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeightManger.bold,
                      ),
                    ),
                    TextSpan(
                      text: S.of(context).privacyPolicyContactBody,
                      style: TextStyle(fontSize: 14.sp, color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.pushnamed(Routes.contactUs);
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
