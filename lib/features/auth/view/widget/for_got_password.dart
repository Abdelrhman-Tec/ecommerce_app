import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:ecommerce_app/core/constants/strings.dart';
import 'package:flutter/material.dart';

Widget forgotYourPassword({Function()? ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Align(
      alignment: Alignment.topLeft,
      child: Text.rich(
        TextSpan(
          text: AppStrings.forgotPassword, // Make sure this string exists
          children: [
            TextSpan(
              text: AppStrings.resetPassword, // Make sure this string exists
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
