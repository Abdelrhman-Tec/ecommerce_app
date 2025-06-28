import 'package:ecommerce_app/features/auth/view/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class FormFieldItem extends StatelessWidget {
  final String label;
  final bool showObscureIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const FormFieldItem({
    super.key,
    required this.label,
    this.showObscureIcon = false,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: CustomTextField(
        hintText: label,
        labelText: label,
        showObscureIcon: showObscureIcon,
        controller: controller,
        validator: validator,
      ),
    );
  }
}
