import 'package:ecommerce_app/features/onboarding/view/widget/character_model_image.dart';
import 'package:ecommerce_app/features/onboarding/view/widget/get_started_button.dart';
import 'package:ecommerce_app/features/onboarding/view/widget/onboarding_title_image.dart';
import 'package:ecommerce_app/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
void _navigateToRegister() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('seenOnboarding', true); 
  Navigator.pushReplacementNamed(context, AppRouter.register);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildOnboardingTitleImage(),
          buildCharacterModelImage(),
          GetStartedButton(onTap: _navigateToRegister),
        ],
      ),
    );
  }
}
