import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final String? prefixicon;
  final bool isPassword;
  const CustomTextField({
    super.key,
    required this.hint,
    this.prefixicon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: prefixicon == null ? null : Image.asset(prefixicon!),
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : null,
        hintText: hint,
      ),
    );
  }
}
