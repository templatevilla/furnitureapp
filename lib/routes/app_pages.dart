import 'package:flutter/material.dart';

import '../view/boottom_navigation_bar/bottom_navigation_bar.dart';
import '../view/detail_page/detail_screen.dart';
import '../view/home_screen/home_screen.dart';
import '../view/onboarding/onboarding_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const initialRoute = Routes.onboardingScreenRoute;
  static Map<String, WidgetBuilder> routes = {
    Routes.onboardingScreenRoute: (context) => const OnboardingScreen(),
    Routes.homeScreenRoute: (context) => const HomeScreen(),
    Routes.homeMainScreenRoute: (context) => const HomeMainScreen(),
    Routes.detailScreenRoute: (context) =>  DetailScreen(),
    // Routes.introRoute: (context) => const IntroScreen(),

  };

}
