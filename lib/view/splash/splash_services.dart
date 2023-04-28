import 'dart:async';

import 'package:docter_app/utils/routing/routeNames.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogedin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    Timer(Duration(seconds: 5), () {
      if (user != null) {
        Navigator.pushNamed(context, RouteName.hospitals);
      } else {
        Navigator.pushNamed(context, RouteName.hospitals);
      }
    });
  }
}
