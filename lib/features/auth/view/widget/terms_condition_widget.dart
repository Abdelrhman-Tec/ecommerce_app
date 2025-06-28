import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:ecommerce_app/core/constants/strings.dart';
import 'package:flutter/material.dart';

Widget termsConditionWidget() {
  return Text.rich(
    TextSpan(
      text: AppStrings.termsAgreement,
      children: [
        TextSpan(
          text: AppStrings.termsUnderLine,
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
