import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_azkar/core/routing/routes.dart';

import '../../feature/logic/cubit/all_surahs_cubit.dart';
import '../../feature/ui/on_boarding/on_boardin_screen.dart';
import '../../feature/ui/on_boarding/on_boarding_screen_three.dart';
import '../../feature/ui/on_boarding/on_bording_screnn_two.dart';
import '../../feature/ui/screens/about_application/contact_us_screen.dart';
import '../../feature/ui/screens/about_application/privacy_policy_screen.dart';
import '../../feature/ui/screens/about_application/terms_and_conditions_screen.dart';
import '../../feature/ui/screens/azkar/home/azkar.dart';
import '../../feature/ui/screens/azkar/evening.dart';
import '../../feature/ui/screens/azkar/moorning.dart';
import '../../feature/ui/screens/quran/cubit/quran_cubit.dart';
import '../../feature/ui/screens/quran/screen/quran.dart';
import '../../feature/ui/screens/quran/screen/surah.dart';
import '../../feature/widget/bottom_navigation.dart';
import '../../feature/ui/screens/about_application/about_application_screen.dart';
import '../../feature/ui/screens/ahkam/ahkam.dart';
import '../../feature/ui/screens/azkar/post_pryar.dart';
import '../../feature/ui/screens/azkar/sleeping.dart';
import '../../feature/ui/screens/qibla/qibla.dart';
import '../../feature/ui/screens/sebha/sebha.dart';

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
