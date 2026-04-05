// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_azkar/core/helpers/padding.dart';
import 'package:quran_azkar/core/theming/font_weght.dart';
import 'package:quran_azkar/feature/widget/list_tile_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theming/colors.dart';
import '../../../../generated/l10n.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  Future<void> _launchUrl(String urlString, BuildContext context) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('حدث خطأ، حاول مرة أخرى')));
    }
  }

  Future<void> _launchEmail(String email, BuildContext context) async {
    final Uri emailLaunchUri = Uri(scheme: 'mailto', path: email);
    if (!await launchUrl(emailLaunchUri)) {
      throw ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('حدث خطأ، حاول مرة أخرى')));
    }
  }

  Future<void> _launchPhone(String phone, BuildContext context) async {
    final Uri phoneLaunchUri = Uri(scheme: 'tel', path: phone);
    if (!await launchUrl(phoneLaunchUri)) {
      throw ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('حدث خطأ، حاول مرة أخرى')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.offWhite,
      appBar: AppBar(
        title: Text(S.of(context).contactUs),
        centerTitle: false,
        backgroundColor: ColorsManger.offWhite,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.h, left: 16.w, right: 16.w),
        child: Column(
          children: [
            Text(
              S.of(context).contactUsText,

              style: TextStyle(fontSize: 14.sp),
            ),
            verticalSpace(30.h),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorsManger.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: ColorsManger.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                    child: Text(S.of(context).contactUs),
                  ),
                  verticalSpace(8.h),
                  Card(
                    color: ColorsManger.white,
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    child: ListTileWidget(
                      ontap: () => _launchPhone('+20 01500730240', context),
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: ColorsManger.grayLight.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.phone, color: Colors.black),
                      ),
                      title: Text(S.of(context).contactNumber),
                      subtitle: const Text('+20 01500730240'),
                    ),
                  ),
                  Card(
                    color: ColorsManger.white,
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    child: ListTileWidget(
                      ontap: () =>
                          _launchEmail('aelbadri23@gmail.com', context),
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: ColorsManger.grayLight.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.email, color: Colors.black),
                      ),
                      title: Text(S.of(context).contactEmail),
                      subtitle: const Text('aelbadri23@gmail.com'),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(30.h),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorsManger.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: ColorsManger.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    S.of(context).followUs,
                    style: TextStyle(
                      fontWeight: FontWeightManger.regular,
                      fontSize: 16.sp,
                    ),
                  ),
                  verticalSpace(16.h),
                  ListTileWidget(
                    ontap: () => _launchUrl(
                      'https://web.facebook.com/ahmed.elbadri.58910',
                      context,
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.squareFacebook,
                        color: Colors.blue,
                      ),
                    ),
                    title: const Text('Facebook'),
                    subtitle: const Text('Ahmed Elbadri'),
                  ),
                  ListTileWidget(
                    ontap: () => _launchUrl(
                      'https://www.linkedin.com/in/ahmed-elbadry-23a1b7245/',
                      context,
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.linkedin,
                        color: Colors.blueAccent,
                      ),
                    ),
                    title: const Text('LinkedIn'),
                    subtitle: const Text('Ahmed Elbadri'),
                  ),
                  ListTileWidget(
                    ontap: () => _launchUrl(
                      'https://www.instagram.com/elbadri84/',
                      context,
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.instagram,
                        color: Colors.redAccent,
                      ),
                    ),
                    title: const Text('Instagram'),
                    subtitle: const Text('Ahmed Elbadri'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListtileWidget extends StatelessWidget {
  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final VoidCallback? onTap;
  const ListtileWidget({
    super.key,
    this.title,
    this.subtitle,
    this.leading,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      subtitle: subtitle,
      onTap: onTap,
      leading: leading,
    );
  }
}
