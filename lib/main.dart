import 'package:ecommerce_app/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ecommerce_app/app/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/features/auth/view_model/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/cart/view_model/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/products/view_model/cubit/product_cubit.dart';
import 'package:ecommerce_app/features/products/data/repository/product_repository.dart';
import 'package:ecommerce_app/features/products/data/api/product_api.dart';
import 'package:dio/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final productRepository = ProductRepository(productApi: ProductApi(dio: Dio()));

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => ProductCubit(productRepository: productRepository)),
      ],
      child: const EcommerceApp(initialRoute: AppRouter.splash),
    ),
  );
}
