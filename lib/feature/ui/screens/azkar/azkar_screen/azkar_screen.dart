import 'package:flutter/material.dart';
import 'package:quran_azkar/feature/ui/screens/azkar/azkar_screen/azkar_screen_widget/azkar_screen_body.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../generated/l10n.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      // backgroundColor: isDark
      //     ? ColorsManger.backgroundDark
      //     : ColorsManger.offWhite,
      appBar: AppBar(
        title: Text(S.of(context).azkar),
        centerTitle: true,
        backgroundColor: isDark
            ? ColorsManger.backgroundDark
            : ColorsManger.white,
      ),
      body: AzkarScreenBody(isDark: isDark),
    );
  }
}
