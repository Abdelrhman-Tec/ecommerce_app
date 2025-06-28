import 'package:ecommerce_app/core/constants/assets.dart';
import 'package:ecommerce_app/core/constants/colors.dart' show AppColors;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 52,
          height: 56,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(child: SvgPicture.asset(Assets.filter)),
          ),
        ),
      ],
    );
  }
}
