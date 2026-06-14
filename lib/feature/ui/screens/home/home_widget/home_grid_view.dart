import 'package:flutter/material.dart';
import 'package:quran_azkar/core/helpers/padding.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    this.title,
    this.subtitle,
    this.icon,
    this.backgroundColor,
    this.onTap,
    super.key,
  });
  final Widget? title;
  final Widget? subtitle;
  final Color? backgroundColor;
  final Widget? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: Colors.white.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: icon!),
                  verticalSpace(7),
                  ListTile(subtitle: subtitle, title: title),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -15,
            left: -15,
            child: IconTheme(
              data: const IconThemeData(
                opacity: 0.1,
                size: 50,
                color: Color(0xff8AD7A7),
              ),
              child: icon!,
            ),
          ),
        ],
      ),
    );
  }
}
