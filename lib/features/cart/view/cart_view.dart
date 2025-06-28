import 'package:ecommerce_app/core/constants/assets.dart';
import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:ecommerce_app/core/constants/strings.dart';
import 'package:ecommerce_app/core/utils/custom_app_bar.dart';
import 'package:ecommerce_app/features/cart/view/widget/cart_item.dart';
import 'package:ecommerce_app/features/cart/view_model/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/model/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CartView extends StatelessWidget {
  final PersistentTabController controller;

  const CartView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        iconAssetLeft: Assets.arrowIconBack,
        iconAssetRight: Assets.assetsImagesBell,
        titlePage: AppStrings.myCart,
        showIconRight: true,
        showTitlePage: true,
        ontapIconLeft: () {
          controller.jumpToTab(0);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<CartCubit, List<CartItemModel>>(
          builder: (context, cartItems) {
            if (cartItems.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.assetsImagesCartIcon, width: 100),
                    const SizedBox(height: 20),
                    Text(
                      AppStrings.emptyCart,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      AppStrings.emptyCartMessage,
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }

            return ListView.separated(
              itemCount: cartItems.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return CartItem(cartItemModel: cartItems[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
