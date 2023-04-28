import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:docter_app/utils/colors/colors.dart';
import 'package:flutter/material.dart';

import 'splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashServices().isLogedin(context);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        backgroundColor: FlexColor.deepPurpleLightTertiary,
        body: Column(
          children: [
            Container(
              height: height * .7,
              width: height * 1,
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(50))),
              child: Image.asset('assets/image/orignal.jpeg', fit: BoxFit.fill),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 10, left: 10),
              child: AnimatedTextKit(
                repeatForever: false,
                animatedTexts: [
                  TypewriterAnimatedText(
                      'The Best Way To Find Yourself is to loose yourself in the services of others',
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: FlexColor.lightSurfaceOrg)),
                ],
              ),
            )
          ],
        ));
  }
}
