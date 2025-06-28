import 'package:dio/dio.dart';

class ProductApi {
  final Dio dio;

  ProductApi({required this.dio});

  Future<List<dynamic>> getProductsByCategory(String category) async {
    try {
      Response response = await dio.get(
        "https://fakestoreapi.com/products/category/$category",
      );
      return response.data;
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load products by category');
    }
  }
}
