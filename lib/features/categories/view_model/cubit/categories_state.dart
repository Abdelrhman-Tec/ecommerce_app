part of 'categories_cubit.dart';

sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoaded extends CategoriesState {
  final List<CategoryModel> category;

  CategoriesLoaded({required this.category});
}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesError extends CategoriesState {
  final String message;

  CategoriesError({required this.message});
}
