import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_azkar/core/routing/routes.dart';

import 'package:quran_azkar/feature/quran/logic/cubit/all_surahs_cubit.dart';
import 'package:quran_azkar/feature/on_boarding/ui/on_boardin_screen.dart';
import 'package:quran_azkar/feature/on_boarding/ui/on_boarding_screen_three.dart';
import 'package:quran_azkar/feature/on_boarding/ui/on_bording_screnn_two.dart';
import 'package:quran_azkar/feature/about_application/ui/contact_us_screen.dart';
import 'package:quran_azkar/feature/about_application/ui/privacy_policy_screen.dart';
import 'package:quran_azkar/feature/about_application/ui/terms_and_conditions_screen.dart';
import 'package:quran_azkar/feature/azkar/ui/azkar_screen.dart';
import 'package:quran_azkar/feature/azkar/ui/evening.dart';
import 'package:quran_azkar/feature/azkar/ui/moorning.dart';
import 'package:quran_azkar/feature/quran/logic/cubit/quran_cubit.dart';
import 'package:quran_azkar/feature/quran/ui/quran_screen.dart';
import 'package:quran_azkar/feature/quran/ui/surah_screen.dart';
import 'package:quran_azkar/feature/shared/widgets/bottom_navigation.dart';
import 'package:quran_azkar/feature/about_application/ui/about_application_screen.dart';
import 'package:quran_azkar/feature/ahkam/ui/ahkam_screen.dart';
import 'package:quran_azkar/feature/azkar/ui/post_pryar.dart';
import 'package:quran_azkar/feature/azkar/ui/sleeping.dart';
import 'package:quran_azkar/feature/qibla/ui/qibla_screen.dart';
import 'package:quran_azkar/feature/sebha/ui/sebha_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (context) => const OnBoardinScreen());

      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const BottonNavigation(),
        );
      case Routes.onBoardingTwo:
        return MaterialPageRoute(
          builder: (context) => const OnBordingScrennTwo(),
        );
      case Routes.onBoardingThree:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreenThree(),
        );
      case Routes.surahScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AllSurahsCubit(),
            child: SurahScreen(surahNameTitle: settings.arguments as int),
          ),
        );
      case Routes.about:
        return MaterialPageRoute(
          builder: (context) => const AboutApplicationScreen(),
        );
      case Routes.privacyPolicy:
        return MaterialPageRoute(
          builder: (context) => const PrivacyPolicyScreen(),
        );
      case Routes.termsAndConditions:
        return MaterialPageRoute(
          builder: (context) => const TermsAndConditionsScreen(),
        );
      case Routes.contactUs:
        return MaterialPageRoute(builder: (context) => const ContactUsScreen());
      case Routes.ahkam:
        return MaterialPageRoute(builder: (context) => const AhkamScreen());
      case Routes.qibla:
        return MaterialPageRoute(builder: (context) => const QiblaScreen());
      case Routes.sebha:
        return MaterialPageRoute(builder: (context) => const SebhaScreen());
      case Routes.azkar:
        return MaterialPageRoute(builder: (context) => const AzkarScreen());
      case Routes.quran:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => QuranCubit(),
            child: const QuranScreen(),
          ),
        );
      case Routes.afterPrayerAzkar:
        return MaterialPageRoute(builder: (context) => const PostPryarScreen());
      case Routes.eveningAzkar:
        return MaterialPageRoute(builder: (context) => const EveningScreen());
      case Routes.slipping:
        return MaterialPageRoute(builder: (context) => const SlippingScreen());
      case Routes.morningAzkar:
        return MaterialPageRoute(builder: (context) => const MorningScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(title: const Text('404')),
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
