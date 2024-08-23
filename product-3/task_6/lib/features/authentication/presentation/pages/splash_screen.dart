import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';

import '../../../product/presentation/pages/home_page.dart';
import 'sign_in_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/img/splash_screen_image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(82, 63, 81, 243),
                  Color(0xff3F51F3),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: AnimatedSplashScreen(
              splash: Image.asset('assets/img/Ecom.png'),
              duration: 3000,
              curve: Curves.easeInOut,
              splashIconSize: 350,
              animationDuration: const Duration(milliseconds: 1500),
              backgroundColor: Colors.transparent,
              pageTransitionType: PageTransitionType.fade,
              nextScreen: LoginPage(),
            ),
          ),
        ],
      ),
    );
  }
}