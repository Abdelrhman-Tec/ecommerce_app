import 'package:ecommerce_app/core/constants/assets.dart';
import 'package:ecommerce_app/core/constants/strings.dart';
import 'package:ecommerce_app/core/utils/custom_app_bar.dart';
import 'package:ecommerce_app/features/home/view/home_view.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:ecommerce_app/features/products_details/view/widget/product_details_content.dart';
import 'package:flutter/material.dart';

class ProductsDetailsView extends StatelessWidget {
  final ProductModel? productModel;
  const ProductsDetailsView({super.key, this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        iconAssetLeft: Assets.arrowIconBack,
        showIconRight: true,
        showTitlePage: true,
        iconAssetRight: Assets.assetsImagesBell,
        titlePage: AppStrings.details,
        ontapIconLeft: () => _navigateToRegister(context),
      ),
      body: productModel == null
          ? const Center(child: Text("No product data available"))
          : ProductDetailsContent(productModel: productModel!),
    );
  }
}

void _navigateToRegister(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomeView()));
}
