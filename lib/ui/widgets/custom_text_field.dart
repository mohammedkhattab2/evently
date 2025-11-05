import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final String? prefixicon;
  final bool isPassword;
  final int minLine;
  const CustomTextField({
    super.key,
    required this.hint,
    this.prefixicon,
    this.isPassword = false,
    this.minLine=1 ,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: widget.prefixicon == null
            ? null
            : Image.asset(widget.prefixicon!),
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  obscureText = !obscureText;
                  setState(() {});
                },
                child: Icon(
                  obscureText ? Icons.visibility_off : Icons.remove_red_eye,
                ),
              )
            : null,
        hintText: widget.hint,
      ),
      minLines: widget.minLine,
      maxLines:widget.minLine +1,
      obscureText: widget.isPassword ? obscureText : false,
    );
  }
}
