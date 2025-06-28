import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:ecommerce_app/core/services/app_preferences.dart';
import 'package:ecommerce_app/features/splash/view/widget/splash_screen_widget.dart';
import 'package:ecommerce_app/routes/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  static const _splashDelay = Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateAfterDelay();
    });
  }

  Future<void> _navigateAfterDelay() async {
    await Future.delayed(_splashDelay);

    final seenOnboarding = await AppPreferences.getSeenOnboarding();
    final isLoggedIn = await AppPreferences.isLoggedIn();
    final user = FirebaseAuth.instance.currentUser;

    if (!seenOnboarding) {
      Navigator.pushReplacementNamed(context, AppRouter.onboarding);
    } else if (isLoggedIn && user != null && user.emailVerified) {
      Navigator.pushReplacementNamed(context, AppRouter.homeNavBar);
    } else {
      Navigator.pushReplacementNamed(context, AppRouter.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(child: splashScreenWidget()),
    );
  }
}
