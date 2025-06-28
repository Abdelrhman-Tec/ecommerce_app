import 'package:ecommerce_app/features/products_details/view/products_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:ecommerce_app/features/products/view_model/cubit/product_cubit.dart';
import 'package:ecommerce_app/features/search%20&%20filter/view/filter_view.dart';
import 'package:ecommerce_app/features/search%20&%20filter/view/widget/search_text_form_widget.dart';
import 'package:ecommerce_app/core/constants/strings.dart';

class SearchAndFilterView extends StatefulWidget {
  const SearchAndFilterView({super.key});

  @override
  State<SearchAndFilterView> createState() => _SearchAndFilterViewState();
}

class _SearchAndFilterViewState extends State<SearchAndFilterView> {
  final TextEditingController searchController = TextEditingController();
  List<ProductModel> filteredProducts = [];
  bool _hasSearched = false;

  void handleSearch(String query) {
    setState(() {
      _hasSearched = true;
    });

    if (query.isEmpty) {
      setState(() {
        filteredProducts = [];
      });
      return;
    }

    context.read<ProductCubit>().getProductsByCategory('electronics').then((_) {
      final state = context.read<ProductCubit>().state;
      if (state is ProductLoaded) {
        setState(() {
          filteredProducts = state.products
              .where(
                (product) =>
                    product.title.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: SearchTextField(
                    hintText: AppStrings.searchPlaceholder,
                    controller: searchController,
                    onChanged: handleSearch,
                  ),
                ),
                const SizedBox(width: 10),
                const FilterView(),
              ],
            ),
            const SizedBox(height: 20),

            // Products
            if (_hasSearched)
              filteredProducts.isEmpty
                  ? const Center(child: Text("No products found."))
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(12),
                            leading: Image.network(
                              product.image,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              product.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text('\$${product.price}'),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => ProductsDetailsView(
                                    productModel: product,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
          ],
        ),
      ),
    );
  }
}
