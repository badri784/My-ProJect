import 'package:flutter/material.dart';
import 'package:quran_azkar/core/helpers/extension.dart';
import 'package:quran_azkar/core/routing/routes.dart';
import 'package:quran_azkar/core/theming/colors.dart';
import 'package:quran_azkar/feature/ui/widget/home_grid_view.dart';
import 'package:quran_azkar/generated/l10n.dart';

class ReturnFiveGridView extends StatelessWidget {
  const ReturnFiveGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5,
      crossAxisSpacing: 5,
      mainAxisSpacing: 4,
      childAspectRatio: 1.2,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        HomeGridView(
          onTap: () {
            context.pushnamed(Routes.quran);
          },
          icon: const Icon(
            Icons.menu_book_outlined,
            color: ColorsManger.lightGreen,
          ),
          backgroundColor: const Color(0xffe5eae3),
          title: Text(S.of(context).quran),

          // subtitle: Text(S.of(context).recitationAndReflection),
        ),
        HomeGridView(
          onTap: () {
            context.pushnamed(Routes.azkar);
          },
          icon: const Icon(Icons.sunny, color: ColorsManger.lightGreen),
          backgroundColor: const Color(0xfff5f0e3),
          title: Text(S.of(context).azkar),
          // subtitle: Text(S.of(context).dailyAzkar),
        ),
        HomeGridView(
          onTap: () {
            context.pushnamed(Routes.sebha);
          },
          icon: const Icon(Icons.adjust, color: ColorsManger.lightGreen),
          backgroundColor: const Color(0xffe0ebe0),
          title: Text(S.of(context).sebha),
          // subtitle: Text(S.of(context).rememberGod),
        ),
        HomeGridView(
          onTap: () {
            context.pushnamed(Routes.qibla);
          },
          icon: const Icon(Icons.explore, color: ColorsManger.lightGreen),
          backgroundColor: const Color(0xfff0efe6),
          title: Text(S.of(context).qiblaTitle),
          // subtitle: Text(S.of(context).qiblaDirection),
        ),
        HomeGridView(
          icon: const Icon(Icons.help_outline, color: ColorsManger.lightGreen),
          onTap: () {
            context.pushnamed(Routes.ahkam);
          },
          backgroundColor: const Color(0xfff0efe6),
          title: const Text('احكام'),
          // subtitle: Text(S.of(context).questionsAndInquiries),
        ),
      ],
    );
  }
}
