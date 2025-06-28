import 'package:ecommerce_app/core/constants/assets.dart';
import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:ecommerce_app/core/constants/strings.dart';
import 'package:ecommerce_app/core/utils/primary_button.dart';
import 'package:ecommerce_app/features/cart/model/cart_item_model.dart';
import 'package:ecommerce_app/features/cart/view_model/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsContent extends StatelessWidget {
  final ProductModel? productModel;
  const ProductDetailsContent({super.key, this.productModel});

  @override
  Widget build(BuildContext context) {
    final product = productModel;
    return product == null
        ? const Center(child: Text("No product data available"))
        : CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SizedBox(
                          width: 341,
                          height: 368.53,
                          child: Image.network(product.image),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Color(0xffFFA928)),
                          Text('${product.rating.rate}'),
                          const SizedBox(width: 5),
                          Text(
                            '(${product.rating.count} reviews)',
                            style: const TextStyle(color: Color(0xff808080)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        product.description,
                        style: const TextStyle(color: Color(0xff808080)),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        AppStrings.price,
                        style: TextStyle(
                          color: Color(0xff808080),
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${product.price}',
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          PrimaryButton(
                            onTap: () {
                              context.read<CartCubit>().addToCart(
                                CartItemModel(
                                  id: product.id.toString(),
                                  name: product.title,
                                  price: product.price,
                                  image: product.image,
                                  quantity: 1,
                                ),
                              );
                            },
                            text: AppStrings.addToCart,
                            color: AppColors.primary,
                            textColor: AppColors.secondary,
                            iconAssetTwo: Assets.assetsImagesCart,
                            width: 240,
                            height: 54,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}
