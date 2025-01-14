import 'package:flutter/material.dart';

class AppInputWithoutLabel extends StatelessWidget {
  AppInputWithoutLabel({
    super.key,
    required this.label,
    required this.controller,
    this.backgroundColor = Colors.white,
    required this.hintText,
    this.isEnabled = true,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  final String label;
  final TextEditingController controller;
  final Color backgroundColor;
  final String hintText;
  final bool isEnabled;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  final _border = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  );

  final _focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      color: Colors.black,
      width: 1.5,
    ),
  );

  final _errorBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
    borderSide: BorderSide(
      color: Colors.redAccent,
    ),
  );

  final _errorFocusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      color: Colors.red,
      width: 1.5,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      style: const TextStyle(
        fontSize: 16,
      ),
      enabled: isEnabled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: backgroundColor,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
        contentPadding: const EdgeInsets.all(14),
        border: _border,
        enabledBorder: _border,
        focusedBorder: _focusedBorder,
        errorBorder: _errorBorder,
        focusedErrorBorder: _errorFocusedBorder,
        errorStyle: const TextStyle(
          color: Colors.redAccent,
          fontSize: 15,
        ),
      ),
      validator: validator ??
          (value) =>
              value!.isEmpty ? '${label.toLowerCase()} is required' : null,
    );
  }
}
