import 'package:clean_architecture_rivaan_ranawat/utils/widgets/button/app_primary_solid_button.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/input/app_input_with_label.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/input/app_password_with_label.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void showHideText(type) {
    setState(() {
      if (type == "password") {
        _isPasswordHidden = !_isPasswordHidden;
      } else if (type == "confirmPassword") {
        _isConfirmPasswordHidden = !_isConfirmPasswordHidden;
      }
    });
  }

  String? _validateEmail(String? value) {
    const emailPattern = r'^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+';
    if (value == null || value.isEmpty) {
      return 'email address is required';
    } else if (!RegExp(emailPattern).hasMatch(value)) {
      return 'enter a valid email address';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'confirm password is required';
    } else if (value != _passwordController.text) {
      return 'passwords do not match';
    }
    return null;
  }

  void onSignUpButtonPressed() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Sign up.',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                AppInputWithLabel(
                  controller: _emailController,
                  hintText: "example@email.com",
                  label: "Email Address",
                  validator: _validateEmail,
                ),
                const SizedBox(height: 20),
                AppPasswordInputWithLabel(
                  label: "Password",
                  controller: _passwordController,
                  hintText: "********",
                  obscureText: _isPasswordHidden,
                  showHideText: () {
                    showHideText("password");
                  },
                ),
                const SizedBox(height: 20),
                AppPasswordInputWithLabel(
                  label: "Confirm Password",
                  controller: _confirmPasswordController,
                  hintText: "********",
                  obscureText: _isConfirmPasswordHidden,
                  showHideText: () {
                    showHideText("confirmPassword");
                  },
                  validator: _validateConfirmPassword,
                ),
                const SizedBox(height: 30),
                AppPrimarySoidButton(
                  onPressed: onSignUpButtonPressed,
                  buttonText: "Sign Up",
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
