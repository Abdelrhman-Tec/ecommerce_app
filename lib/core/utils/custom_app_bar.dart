import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? width;
  final bool? showTitlePage;
  final bool? showIconRight;
  final String? iconAssetLeft;
  final String? iconAssetRight;
  final Function()? ontapIconLeft;
  final Function()? ontapIconRight;
  final String? titlePage;

  const CustomAppBar({
    super.key,
    this.width,
    this.showTitlePage = false,
    this.showIconRight = false,
    this.iconAssetLeft,
    this.iconAssetRight,
    this.titlePage,
    this.ontapIconLeft,
    this.ontapIconRight,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 100, // ⇐ ده بيحدد ارتفاع AppBar
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconAssetLeft != null
              ? GestureDetector(
                  onTap: ontapIconLeft,
                  child: SvgPicture.asset(iconAssetLeft!, width: width ?? 25),
                )
              : SizedBox(width: width ?? 25),
          if (showTitlePage == true && titlePage != null)
            Expanded(
              child: Center(
                child: Text(
                  titlePage!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
          else
            const Spacer(),
          showIconRight == true && iconAssetRight != null
              ? GestureDetector(
                  onTap: ontapIconRight,
                  child: SvgPicture.asset(iconAssetRight!, width: 25),
                )
              : const SizedBox(width: 25),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90); // ⇐ لازم يطابق toolbarHeight
}
