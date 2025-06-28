import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:ecommerce_app/features/categories/view_model/cubit/categories_cubit.dart';
import 'package:ecommerce_app/features/products/view_model/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesBody extends StatefulWidget {
  const CategoriesBody({super.key});

  @override
  State<CategoriesBody> createState() => _CategoriesBodyState();
}

class _CategoriesBodyState extends State<CategoriesBody> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 30),
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              return switch (state) {
                CategoriesLoading() => Center(
                  child: Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                ),
                CategoriesLoaded(:final category) => _buildCategoriesList(
                  category,
                ),
                CategoriesError(:final message) => Center(child: Text(message)),
                _ => const SizedBox.shrink(),
              };
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesList(List categoryList) {
    return SizedBox(
      height: 35,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categoryList.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, index) => _buildCategoryItem(
          categoryName: categoryList[index].name,
          index: index,
        ),
      ),
    );
  }

  Widget _buildCategoryItem({
    required String categoryName,
    required int index,
  }) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        if (_selectedIndex == index) return;
        setState(() => _selectedIndex = index);
        context.read<ProductCubit>().getProductsByCategory(categoryName);
      },
      child: Container(
        width: 90,
        height: 35,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.white,
          border: Border.all(color: AppColors.primary),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              categoryName,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : AppColors.primary,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
