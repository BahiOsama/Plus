import 'package:first_project/app_images.dart';
import 'package:first_project/auth/persentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../../../helper/page_route_fadeTransition.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.of(context)
            .pushReplacement(AnimationRoute(page: const LoginScreen())));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppImages.splashImage),
      ),
    );
  }
}
