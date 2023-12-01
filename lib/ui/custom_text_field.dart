import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool obscureText;
  final int maxLines;
  final double? height;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    this.obscureText = false,
    required this.hintText,
    this.height,
    this.controller,
    this.maxLines = 1,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool displayClearButton = false;

  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: widget.height,
      child: TextFormField(
        controller: widget.controller,
        maxLines: widget.maxLines,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 1),
          ),
          hintText: widget.hintText,
          suffix: GestureDetector(
            child: const Icon(Icons.close, size: 20),
            onTap: () {
              widget.controller?.clear();
            },
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
