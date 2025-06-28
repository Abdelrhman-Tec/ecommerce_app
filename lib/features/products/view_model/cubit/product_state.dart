part of 'product_cubit.dart';

abstract class ProductState {
  const ProductState();
}

class ProductInitial extends ProductState {
  const ProductInitial();
}

class ProductLoading extends ProductState {
  const ProductLoading();
}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;

  const ProductLoaded({required this.products});
}

class ProductError extends ProductState {
  final String message;

  const ProductError({required this.message});
}

class ProductFavoritesUpdated extends ProductState {
  final List<ProductModel> products;

  const ProductFavoritesUpdated({required this.products});
}
