import 'package:ecommerce_app/features/cart/view/cart_view.dart';
import 'package:ecommerce_app/features/home/view/home_view.dart';
import 'package:ecommerce_app/features/home/view/widget/home_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/features/splash/view/splash_view.dart';
import 'package:ecommerce_app/features/onboarding/view/onboarding_view.dart';
import 'package:ecommerce_app/features/auth/view/login_view.dart';
import 'package:ecommerce_app/features/auth/view/register_view.dart';
import 'package:ecommerce_app/features/auth/view/for_got_password_view.dart';
import 'package:ecommerce_app/features/products_details/view/products_details_view.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:ecommerce_app/features/products/view/product_list_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class AppRouter {
  // Route names
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String register = '/register';
  static const String login = '/login';
  static const String forgotPassword = '/forgotPassword';
  static const String homeNavBar = '/homeNavBar';
  static const String home = '/home';
  static const String cart = '/cart';
  static const String productDetails = '/productDetails';
  static const String products = '/products';

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());

      case register:
        return MaterialPageRoute(builder: (_) => const RegisterView());

      case login:
        return MaterialPageRoute(builder: (_) => const LoginView());

      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());

      case homeNavBar:
        return MaterialPageRoute(builder: (_) => const HomeNavBar());

      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());

      case cart:
        final controller = settings.arguments as PersistentTabController?;
        if (controller == null) {
          return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(child: Text('Controller is required for CartView')),
            ),
          );
        }
        return MaterialPageRoute(
          builder: (_) => CartView(controller: controller),
        );

      case productDetails:
        final product = settings.arguments as ProductModel?;
        return MaterialPageRoute(
          builder: (_) => ProductsDetailsView(productModel: product),
        );

      case products:
        return MaterialPageRoute(
          builder: (_) => const ProductListView(category: ''),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('404 - Page not found'))),
        );
    }
  }
}
