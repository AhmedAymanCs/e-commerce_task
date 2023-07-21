import 'package:flutter/material.dart';

import 'package:magd_task/presentation/screens/user/help_screen.dart';
import 'package:magd_task/presentation/screens/user/layout_of_homescreens.dart';
import 'package:magd_task/presentation/screens/user/login_screen.dart';
import 'package:magd_task/presentation/screens/user/otp_screen.dart';
import 'package:magd_task/presentation/screens/shared/splash_screen.dart';

class Routes {
  static const String splashRoute = '/splash'; // route name for splash screen
  static const String loginRoute = '/login'; // route name for login screen
  static const String otpRoute = '/otp'; // route name for otp screen
  static const String helpRoute = '/help'; // route name for help screen
  static const String layoutRoute = '/layout'; // route name for layout screen

}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case '/':
      //   return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.otpRoute:
         return MaterialPageRoute(builder: (_)=> const OTPScreen());
      case Routes.helpRoute:
        return MaterialPageRoute(builder: (_)=> const HelpScreen());
      case Routes.layoutRoute:
        return MaterialPageRoute(builder: (_)=> const HomeLayout());
      default:
        return getUnDefinededRoute();
    }
  }

  static Route<dynamic> getUnDefinededRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('unDefinededRoute'),
              ),
              body: const Center(
                child: Text(
                  ('unDefinededRoute'),
                ),
              ),
            ));
  }
}
