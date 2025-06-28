import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/categories/data/api/categories_api.dart';
import 'package:ecommerce_app/features/categories/data/repository/categories_repository.dart';
import 'package:ecommerce_app/features/categories/view/widget/categories_body_widget.dart';
import 'package:ecommerce_app/features/categories/view_model/cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoriesCubit(
        CategoriesRepository(categoriesApi: CategoriesApi(dio: Dio())),
      )..featchData(),
      child: const CategoriesBody(),
    );
  }
}
