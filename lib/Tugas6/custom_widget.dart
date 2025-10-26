import 'package:flutter/material.dart';

class CustomWidget extends StatefulWidget {
  const CustomWidget({
    super.key,
    this.isPassword = false,
    this.controller,
    this.hintText = '',
    this.validator,
  });

  final bool isPassword;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  _CustomWidgetState createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField( // ✅ ubah dari TextField ke TextFormField
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPassword ? _obscurePassword : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF4169E1)),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              )
            : null,
      ),
      style: const TextStyle(fontSize: 16),
    );
  }
}
