import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final int maxLines;
  final double? height;
  final String hintText;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.height,
    this.controller,
    this.maxLines = 1,
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
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      height: widget.height,
      child: TextField(
        controller: widget.controller,
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1),
          ),
          enabledBorder: const OutlineInputBorder(
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
      ),
    );
  }
}
