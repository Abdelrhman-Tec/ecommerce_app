import 'package:ecommerce_app/core/constants/assets.dart';
import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:ecommerce_app/core/constants/strings.dart';
import 'package:ecommerce_app/core/utils/primary_button.dart';
import 'package:ecommerce_app/features/auth/view/widget/alerady_have_an_account.dart';
import 'package:ecommerce_app/features/auth/view/widget/form_field_item.dart';
import 'package:ecommerce_app/features/auth/view/widget/header_section.dart';
import 'package:ecommerce_app/features/auth/view/widget/terms_condition_widget.dart';
import 'package:ecommerce_app/features/auth/view_model/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/view_model/cubit/auth_state.dart';
import 'package:ecommerce_app/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _navigateToLogin() {
    Navigator.pushReplacementNamed(context, AppRouter.login);
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().registration(
        fullName: _fullNameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
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
                  'Account created successfully!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRouter.login,
              (route) => false,
            );
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
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _Header(),

                  const SizedBox(height: 24),

                  FormFieldItem(
                    label: AppStrings.fullName,
                    controller: _fullNameController,
                    validator: (value) =>
                        value!.isEmpty ? "Please enter your full name" : null,
                  ),
                  FormFieldItem(
                    label: AppStrings.email,
                    controller: _emailController,
                    validator: (value) =>
                        value!.contains('@') ? null : "Enter valid email",
                  ),
                  FormFieldItem(
                    label: AppStrings.password,
                    showObscureIcon: true,
                    controller: _passwordController,
                    validator: (value) => value!.length < 6
                        ? "Password must be at least 6 characters"
                        : null,
                  ),

                  const SizedBox(height: 10),
                  termsConditionWidget(),
                  const SizedBox(height: 24),

                  PrimaryButton(
                    text: state is AuthLoading ? '' : AppStrings.createAccount,
                    color: AppColors.primary,
                    textColor: AppColors.secondary,
                    onTap: state is AuthLoading ? null : _register,
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
                    onTap: () {}, // Google auth
                  ),
                  const SizedBox(height: 16),

                  PrimaryButton(
                    iconAssetTwo: Assets.assetsImagesLogosFacebook,
                    text: AppStrings.signUpWithFacebook,
                    color: AppColors.facebookBlue,
                    textColor: AppColors.secondary,
                    onTap: () {}, // Facebook auth
                  ),

                  const SizedBox(height: 10),
                  alreadyHaveAnAccount(ontap: _navigateToLogin),
                  const SizedBox(height: 24),
                ],
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
      title: AppStrings.createAccount,
      subTitle: AppStrings.letsCreateAccount,
      height: 10,
    );
  }
}
