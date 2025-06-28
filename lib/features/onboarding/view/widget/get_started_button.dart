import 'package:ecommerce_app/core/constants/assets.dart';
import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:ecommerce_app/core/constants/strings.dart';
import 'package:ecommerce_app/core/utils/primary_button.dart';
import 'package:ecommerce_app/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStartedButton extends StatelessWidget {
  final VoidCallback? onTap;

  const GetStartedButton({super.key, this.onTap});

  Future<void> _handleGetStarted(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);
    Navigator.pushReplacementNamed(context, AppRouter.register);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        width: 700,
        height: 107,
        color: Colors.white,
        child: Align(
          alignment: Alignment.center,
          child: PrimaryButton(
            text: AppStrings.getStarted,
            iconAsset: Assets.arrowIconGo,
            textColor: AppColors.secondary,
            onTap: () => _handleGetStarted(context),
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
