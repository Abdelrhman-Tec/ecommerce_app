import 'package:ecommerce_app/core/constants/assets.dart';
import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:ecommerce_app/features/cart/model/cart_item_model.dart';
import 'package:ecommerce_app/features/cart/view_model/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartItem extends StatelessWidget {
  final CartItemModel cartItemModel;
  const CartItem({super.key, required this.cartItemModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 107,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      child: Row(
        children: [
          // Product Image
          Image.network(
            cartItemModel.image,
            width: 70,
            height: 70,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 12),

          // Product details and controls
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + remove icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        cartItemModel.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().removeFromCart(
                          cartItemModel.id,
                        );
                      },
                      child: SvgPicture.asset(
                        Assets.assetsImagesRemoveIcon,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // Quantity
                Text(
                  'Count: ${cartItemModel.quantity}',
                  style: const TextStyle(color: Colors.grey),
                ),

                const Spacer(),

                // Price + Quantity controls
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '\$ ${cartItemModel.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    QuantityButton(
                      icon: Icons.remove,
                      onPressed: () {
                        context.read<CartCubit>().decreaseQuantity(
                          cartItemModel.id,
                        );
                      },
                    ),
                    Text(
                      cartItemModel.quantity.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    QuantityButton(
                      icon: Icons.add,
                      onPressed: () {
                        context.read<CartCubit>().increaseQuantity(
                          cartItemModel.id,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const QuantityButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, size: 20),
      onPressed: onPressed,
      splashRadius: 20,
    );
  }
}
