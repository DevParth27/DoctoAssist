// ignore_for_file: camel_case_types, unused_local_variable

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:uba_doctor/Main_home/Screens/role_selection_screen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: height * 0.3,
              child: LottieBuilder.asset(
                "assets/assets_main/videos/Animation - 1735295355664.json",
              ),
            ),
          ),
        ],
      ),
      nextScreen: const RoleSelectionScreen(),
      animationDuration: const Duration(seconds: 3),
      splashIconSize: height * 0.5,
      backgroundColor: Colors.black87,
    );
  }
}
