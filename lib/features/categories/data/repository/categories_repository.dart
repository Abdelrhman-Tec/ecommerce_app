import 'package:ecommerce_app/features/categories/data/api/categories_api.dart';
import 'package:ecommerce_app/features/categories/data/model/categories_model.dart';

class CategoriesRepository {
  final CategoriesApi categoriesApi;

  CategoriesRepository({required this.categoriesApi});

  Future<List<CategoryModel>> getAllCategories() async {
    final categoriesData = await categoriesApi.getAllCategories();
    return categoriesData.map((item) => CategoryModel.fromJson(item)).toList();
  }
}
