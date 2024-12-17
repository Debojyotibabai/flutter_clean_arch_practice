import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class AppPhoneInputWithLabel extends StatelessWidget {
  AppPhoneInputWithLabel({
    super.key,
    required this.label,
    this.backgroundColor = Colors.white,
    required this.hintText,
    this.isEnabled = true,
    this.keyboardType = TextInputType.text,
    this.validator,
    required this.phoneCountryCodeController,
    required this.phoneNumberController,
  });

  final String label;
  final Color backgroundColor;
  final String hintText;
  final bool isEnabled;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController phoneCountryCodeController;
  final TextEditingController phoneNumberController;

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: CountryCodePicker(
            initialSelection: 'IN',
            showFlagDialog: true,
            onInit: (value) {
              phoneCountryCodeController.text = value!.dialCode!;
            },
            onChanged: (value) {
              phoneCountryCodeController.text = value.dialCode!;
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextFormField(
            keyboardType: keyboardType,
            style: const TextStyle(
              fontSize: 16,
            ),
            enabled: isEnabled,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: phoneNumberController,
            decoration: InputDecoration(
              filled: true,
              fillColor: backgroundColor,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 15.7,
              ),
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
                (value) => value!.isEmpty
                    ? '${label.toLowerCase()} is required'
                    : null,
          ),
        ),
      ],
    );
  }
}
