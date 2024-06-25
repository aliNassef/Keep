import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/app_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 7),
      () {
        GoRouter.of(context).go(AppRouter.homeView);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedTextKit(
          isRepeatingAnimation: true,
          animatedTexts: [
            ScaleAnimatedText(
              'WELCOME',
              //  duration: const Duration(seconds: 1),
              textStyle: AppStyles.textStyle30,
            ),
          ],
        ),
      ),
    );
  }
}
