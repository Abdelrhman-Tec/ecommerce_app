import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:ecommerce_app/features/products/view/widget/product_item.dart';
import 'package:ecommerce_app/features/products/view_model/cubit/product_cubit.dart';
import 'package:ecommerce_app/features/products_details/view/products_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListView extends StatefulWidget {
  final String category;
  const ProductListView({super.key, required this.category});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  bool _hasFetched = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasFetched) {
      context.read<ProductCubit>().getProductsByCategory(widget.category);
      _hasFetched = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return switch (state) {
          ProductLoading() => _buildLoadingIndicator(),
          ProductLoaded(:final products) => _buildProductGrid(products),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(child: CircularProgressIndicator(color: AppColors.primary));
  }

  Widget _buildProductGrid(List<ProductModel> products) {
    final gridHeight = (products.length / 2).ceil() * 320.0;

    return SizedBox(
      height: gridHeight,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.9,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) => ProductItem(
          ontap: () => sendDataPrdouctDetails(products[index], context),
          product: products[index],
        ),
      ),
    );
  }
}

void sendDataPrdouctDetails(ProductModel productModel, BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => ProductsDetailsView(productModel: productModel),
    ),
  );
}
