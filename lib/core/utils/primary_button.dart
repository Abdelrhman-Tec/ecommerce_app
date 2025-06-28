import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  final String? iconAsset;
  final String? iconAssetTwo;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final Widget? child; // ✅ أضفنا child هنا

  const PrimaryButton({
    super.key,
    this.text,
    this.onTap,
    this.iconAsset,
    this.width = 341,
    this.height = 54,
    this.iconAssetTwo,
    required this.color,
    required this.textColor,
    this.child, // ✅ أضفنا هنا كمان
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child:
              child ??
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (iconAssetTwo != null) ...[
                    SvgPicture.asset(iconAssetTwo!, width: 20),
                  ],
                  if (text != null) const SizedBox(width: 10),
                  if (text != null)
                    Text(
                      text!,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  if (iconAsset != null) ...[
                    const SizedBox(width: 10),
                    SvgPicture.asset(iconAsset!),
                  ],
                ],
              ),
        ),
      ),
    );
  }
}
