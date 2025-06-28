import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final bool? showObscureIcon;
  final double? height;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool readOnly;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.showObscureIcon,
    this.controller,
    this.validator,
    this.labelText,
    this.prefixIcon,
    this.height,
    this.keyboardType,
    this.maxLines,
    this.readOnly = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.showObscureIcon == true;
  }

  @override
  Widget build(BuildContext context) {
    final bool isPassword = widget.showObscureIcon == true;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: widget.height),
        if (widget.labelText != null) ...[
          Text(widget.labelText!, style: const TextStyle(fontSize: 18)),
        ],
        const SizedBox(height: 5),
        TextFormField(
          obscuringCharacter: '●',
          cursorColor: Colors.black,
          controller: widget.controller,
          obscureText: isPassword ? obscureText : false,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          maxLines: isPassword ? 1 : (widget.maxLines ?? 1),
          readOnly: widget.readOnly,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon != null
                ? Icon(widget.prefixIcon)
                : null,
            hintText: widget.hintText,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: obscureText
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
