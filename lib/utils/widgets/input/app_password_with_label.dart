import 'package:flutter/material.dart';

class AppPasswordInputWithLabel extends StatelessWidget {
  AppPasswordInputWithLabel({
    super.key,
    required this.label,
    required this.controller,
    this.backgroundColor = Colors.white,
    required this.hintText,
    this.isEnabled = true,
    required this.obscureText,
    required this.showHideText,
    this.validator,
  });

  final String label;
  final TextEditingController controller;
  final Color backgroundColor;
  final String hintText;
  final bool isEnabled;
  final bool obscureText;
  final Function showHideText;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        TextFormField(
          style: const TextStyle(
            fontSize: 16,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          enabled: isEnabled,
          obscureText: obscureText,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () => showHideText(),
              child: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.black,
                size: 24,
              ),
            ),
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
        ),
      ],
    );
  }
}
