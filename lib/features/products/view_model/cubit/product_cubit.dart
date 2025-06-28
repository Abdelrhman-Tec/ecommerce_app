import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:ecommerce_app/features/products/data/repository/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;
  List<ProductModel> productFavorites = [];

  ProductCubit({required this.productRepository})
      : super(const ProductInitial());

  Future<void> getProductsByCategory(String category) async {
    emit(const ProductLoading());
    try {
      final products = await productRepository.getProductsByCategory(category);
      emit(ProductLoaded(products: products));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }

  void toggleFavorite(ProductModel product) {
    if (productFavorites.contains(product)) {
      productFavorites.remove(product);
    } else {
      productFavorites.add(product);
    }

    emit(
      ProductFavoritesUpdated(
        products: List<ProductModel>.from(productFavorites),
      ),
    );
  }
}
