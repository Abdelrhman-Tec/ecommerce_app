import 'package:ecommerce_app/core/constants/assets.dart';
import 'package:flutter/material.dart';

Widget buildCharacterModelImage() {
  return SizedBox(
    width: double.infinity,
    height: 1000,
    child: Image.asset(Assets.onboardingCharacterModel, fit: BoxFit.cover),
  );
}
