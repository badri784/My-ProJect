import 'package:flutter/material.dart';
import 'package:quran_azkar/core/helpers/extension.dart';
import 'package:quran_azkar/core/routing/routes.dart';
import 'package:quran_azkar/feature/home/ui/widgets/home_grid_view.dart';
import 'package:quran_azkar/generated/l10n.dart';

class ReturnTwoGridView extends StatelessWidget {
  const ReturnTwoGridView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        HomeCard(
          onTap: () {
            context.pushnamed(Routes.quran);
          },
          icon: Icon(
            Icons.menu_book_outlined,
            color: isDark ? Colors.white : const Color(0xff8AD7A7),
          ),
          backgroundColor: const Color(0xffe5eae3),
          title: Text(S.of(context).quran),

          subtitle: Text(S.of(context).recitationAndReflection),
        ),
        HomeCard(
          onTap: () {
            context.pushnamed(Routes.azkar);
          },
          icon: const Icon(Icons.sunny, color: Color(0xff8AD7A7)),
          backgroundColor: const Color(0xfff5f0e3),
          title: Text(S.of(context).azkar),
          subtitle: Text(S.of(context).dailyAzkar),
        ),
        HomeCard(
          onTap: () {
            context.pushnamed(Routes.sebha);
          },
          icon: const Icon(Icons.adjust, color: Color(0xff8AD7A7)),
          backgroundColor: const Color(0xffe0ebe0),
          title: Text(S.of(context).sebha),
          subtitle: Text(S.of(context).rememberGod),
        ),
        HomeCard(
          onTap: () {
            context.pushnamed(Routes.qibla);
          },
          icon: const Icon(Icons.explore, color: Color(0xff8AD7A7)),
          backgroundColor: const Color(0xfff0efe6),
          title: Text(S.of(context).qiblaTitle),
          subtitle: Text(S.of(context).qiblaDirection),
        ),
        HomeCard(
          icon: const Icon(Icons.help_outline, color: Color(0xff8AD7A7)),
          onTap: () {
            context.pushnamed(Routes.ahkam);
          },
          backgroundColor: const Color(0xfff0efe6),
          title: const Text('احكام'),
          subtitle: Text(S.of(context).questionsAndInquiries),
        ),
      ],
    );
  }
}
