import 'package:ecommerce_app/routes/app_router.dart';
import 'package:flutter/material.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key, required this.initialRoute});

  final String initialRoute;

  static final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}

