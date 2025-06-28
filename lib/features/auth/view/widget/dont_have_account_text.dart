import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:ecommerce_app/core/constants/strings.dart';
import 'package:flutter/material.dart';

Widget dontHaveAccountText({Function()? ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Center(
      child: Text.rich(
        TextSpan(
          text: AppStrings.alreadyHaveAccount,
          children: [
            TextSpan(
              text: AppStrings.join,
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
