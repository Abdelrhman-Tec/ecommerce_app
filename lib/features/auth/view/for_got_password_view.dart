import 'package:ecommerce_app/core/constants/assets.dart';
import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:ecommerce_app/core/constants/strings.dart';
import 'package:ecommerce_app/core/utils/custom_app_bar.dart';
import 'package:ecommerce_app/core/utils/primary_button.dart';
import 'package:ecommerce_app/features/auth/view/widget/form_field_item.dart';
import 'package:ecommerce_app/features/auth/view/widget/header_section.dart';
import 'package:ecommerce_app/routes/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _sendResetLink() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: _emailController.text.trim());

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Reset link sent to your email.')),
        );

        Navigator.pushReplacementNamed(context, AppRouter.login);
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Something went wrong')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Something went wrong')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        iconAssetLeft: Assets.arrowIconBack,
        ontapIconLeft: () => _navigateToLogin(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Header(),
              const SizedBox(height: 24),

              FormFieldItem(
                label: AppStrings.email,
                controller: _emailController,
                validator: (value) =>
                    value!.contains('@') ? null : "Enter a valid email",
              ),

              const SizedBox(height: 24),
              PrimaryButton(
                text: AppStrings.sendCode,
                color: AppColors.primary,
                textColor: AppColors.secondary,
                onTap: _sendResetLink,
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return buildHeaderSection(
      title: AppStrings.forgotPassword,
      subTitle: AppStrings.forgotPasswordDescription,
      height: 10,
    );
  }
}

void _navigateToLogin(BuildContext context) {
  Navigator.pushReplacementNamed(context, AppRouter.login);
}
