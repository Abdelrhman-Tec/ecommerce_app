import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/categories/data/model/categories_model.dart';
import 'package:ecommerce_app/features/categories/data/repository/categories_repository.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepository categoriesRepository;
  CategoriesCubit(this.categoriesRepository) : super(CategoriesInitial());

  Future<void> featchData() async {
    emit(CategoriesLoading());
    try {
      final category = await categoriesRepository.getAllCategories();
      emit(CategoriesLoaded(category: category));
    } catch (e) {
      emit(CategoriesError(message: e.toString()));
    }
  }
}
