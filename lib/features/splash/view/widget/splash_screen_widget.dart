import 'package:ecommerce_app/core/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget splashScreenWidget() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [Center(child: SvgPicture.asset(Assets.assetsImagesLogo))],
  );
}
