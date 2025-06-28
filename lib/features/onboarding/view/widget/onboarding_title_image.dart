import 'package:ecommerce_app/core/constants/assets.dart';
import 'package:flutter/material.dart';

Widget buildOnboardingTitleImage() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
    child: SizedBox(
      width: 324,
      height: 204,
      child: Image.asset(Assets.onboardingTitle),
    ),
  );
}
