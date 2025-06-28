import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:ecommerce_app/features/account/view/account_view.dart';
import 'package:ecommerce_app/features/cart/view/cart_view.dart';
import 'package:ecommerce_app/features/favorites/view/favorites_view.dart';
import 'package:ecommerce_app/features/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomeNavBar extends StatefulWidget {
  final int initialIndex;
  const HomeNavBar({super.key, this.initialIndex = 0});

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  late PersistentTabController controller;

  @override
  void initState() {
    super.initState();
    controller = PersistentTabController(initialIndex: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: buildScreens(), 
      items: navBarsItems(),
      navBarStyle: NavBarStyle.style12,
      backgroundColor: AppColors.secondary,
      decoration: NavBarDecoration(
        border: Border.all(
          strokeAlign: BorderSide.strokeAlignCenter,
          width: 0.30,
          color: AppColors.primary,
        ),
        colorBehindNavBar: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }

  List<Widget> buildScreens() {
    return [
      const HomeView(),
      CartView(controller: controller), // 
      const FavoritesView(),
      const AccountView(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        inactiveIcon: const Icon(Icons.home_outlined),
        title: "Home",
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: const Color(0xff7A7A79),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        inactiveIcon: const Icon(Icons.shopping_cart_outlined),
        title: "Cart",
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: const Color(0xff7A7A79),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        inactiveIcon: const Icon(Icons.favorite_border),
        title: "Favorites",
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: const Color(0xff7A7A79),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        inactiveIcon: const Icon(Icons.person_outline),
        title: "Account",
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: const Color(0xff7A7A79),
      ),
    ];
  }
}
