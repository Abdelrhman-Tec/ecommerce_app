import 'package:dio/dio.dart';

class CategoriesApi {
  final Dio dio;
  CategoriesApi({required this.dio});

  Future<List<dynamic>> getAllCategories() async {
    try {
      Response response = await dio.get(
        "https://fakestoreapi.com/products/categories",
      );
      print(response.data);
      return response.data;
    } catch (e) {
      print(e.toString());
      throw Exception("Failed to load categories");
    }
  }
}
