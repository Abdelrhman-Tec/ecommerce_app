import 'package:ecommerce_app/core/constants/assets.dart';
import 'package:ecommerce_app/core/utils/custom_app_bar.dart';
import 'package:ecommerce_app/features/categories/view/categories_view.dart';
import 'package:ecommerce_app/features/products/view/product_list_view.dart';
import 'package:ecommerce_app/features/search%20&%20filter/view/search_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        iconAssetLeft: Assets.assetsImagesDiscover,
        width: 100,
        iconAssetRight: Assets.assetsImagesBell,
        showIconRight: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SearchAndFilterView()),
          SliverToBoxAdapter(child: CategoriesView()),
          SliverToBoxAdapter(child: ProductListView(category: 'electronics')),
        ],
      ),
    );
  }
}
