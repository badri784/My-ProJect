import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_azkar/core/routing/app_router.dart';
import 'package:quran_azkar/core/routing/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quran_azkar/feature/logic/cubit/settings_cubit.dart';
import 'package:quran_azkar/generated/l10n.dart';

class Quran extends StatelessWidget {
  const Quran(this.appRouter, {super.key});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsCubit(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, settingsState) {
            return MaterialApp(
              theme: ThemeData(brightness: Brightness.dark),
              locale: settingsState.locale,
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
            );
          },
        ),
      ),
    );
  }
}
