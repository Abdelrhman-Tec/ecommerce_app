import 'package:ecommerce_app/features/products/data/api/product_api.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';

class ProductRepository {
  final ProductApi productApi;

  ProductRepository({required this.productApi});

  Future<List<ProductModel>> getProductsByCategory(String category) async {
    print("Fetching category: $category");
    final List<dynamic> productsData = await productApi.getProductsByCategory(
      category,
    );
    return productsData.map((item) => ProductModel.fromJson(item)).toList();
  }
}
