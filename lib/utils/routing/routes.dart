import 'package:docter_app/CleanPractice.dart';
import 'package:docter_app/view/hospital/hospitals.dart';
import 'package:docter_app/view/loginScreen/login.dart';
import 'package:docter_app/view/splash/splash.dart';
import 'package:flutter/material.dart';

import 'routeNames.dart';

class Routes {
  static MaterialPageRoute generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteName.hospitals:
        return MaterialPageRoute(builder: (_) => const Hospitals());
      case RouteName.cleanPractice:
        return MaterialPageRoute(builder: (_) => UserList());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                      child: Text('Routes Not Defined',
                          style: TextStyle(fontSize: 50))),
                ));
    }
  }
}
