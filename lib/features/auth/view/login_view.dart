import 'package:ecommerce_app/core/constants/assets.dart';
import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:ecommerce_app/core/constants/strings.dart';
import 'package:ecommerce_app/core/utils/primary_button.dart';
import 'package:ecommerce_app/features/auth/view/widget/dont_have_account_text.dart';
import 'package:ecommerce_app/features/auth/view/widget/for_got_password.dart';
import 'package:ecommerce_app/features/auth/view/widget/form_field_item.dart';
import 'package:ecommerce_app/features/auth/view/widget/header_section.dart';
import 'package:ecommerce_app/features/auth/view_model/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/view_model/cubit/auth_state.dart';
import 'package:ecommerce_app/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _navigateToRegister() {
    Navigator.pushReplacementNamed(context, AppRouter.register);
  }

  void _navigateToForGotPassword() {
    Navigator.pushReplacementNamed(context, AppRouter.forgotPassword);
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().signIn(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  'Logged in successfully!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
            Navigator.pushReplacementNamed(context, AppRouter.homeNavBar);
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  state.message,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    const _Header(),
                    const SizedBox(height: 24),

                    FormFieldItem(
                      label: AppStrings.email,
                      controller: _emailController,
                      validator: (value) =>
                          value!.contains('@') ? null : "Enter a valid email",
                    ),
                    FormFieldItem(
                      label: AppStrings.password,
                      showObscureIcon: true,
                      controller: _passwordController,
                      validator: (value) =>
                          value!.isEmpty ? "Please enter your password" : null,
                    ),

                    const SizedBox(height: 10),
                    forgotYourPassword(ontap: _navigateToForGotPassword),

                    const SizedBox(height: 24),
                    PrimaryButton(
                      text: state is AuthLoading ? '' : AppStrings.login,
                      color: AppColors.primary,
                      textColor: AppColors.secondary,
                      onTap: state is AuthLoading ? null : _login,
                      child: state is AuthLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : null,
                    ),
                    const SizedBox(height: 24),
                    const Center(
                      child: Text(
                        AppStrings.or,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),

                    const SizedBox(height: 24),
                    PrimaryButton(
                      iconAssetTwo: Assets.assetsImagesLogosGoogleIcon,
                      text: AppStrings.signUpWithGoogle,
                      color: AppColors.secondary,
                      textColor: AppColors.primary,
                      onTap: () {}, // Google Sign In logic here
                    ),

                    const SizedBox(height: 16),
                    PrimaryButton(
                      iconAssetTwo: Assets.assetsImagesLogosFacebook,
                      text: AppStrings.signUpWithFacebook,
                      color: AppColors.facebookBlue,
                      textColor: AppColors.secondary,
                      onTap: () {}, // Facebook Sign In logic here
                    ),

                    const SizedBox(height: 100),
                    dontHaveAccountText(ontap: _navigateToRegister),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Header Section
class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return buildHeaderSection(
      title: AppStrings.login,
      subTitle: AppStrings.greatToSeeYou,
      height: 10,
    );
  }
}
