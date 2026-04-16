import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_azkar/core/routing/app_router.dart';
import 'package:quran_azkar/core/routing/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quran_azkar/generated/l10n.dart';

class Quran extends StatelessWidget {
  const Quran(this.appRouter, {super.key});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        // showPerformanceOverlay: true,
        theme: ThemeData(brightness: Brightness.dark),
        locale: const Locale('ar'),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.home,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
