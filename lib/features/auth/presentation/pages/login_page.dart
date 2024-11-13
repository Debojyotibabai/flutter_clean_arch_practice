import 'package:clean_architecture_rivaan_ranawat/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/button/app_primary_solid_button.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/input/app_input_with_label.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/input/app_password_with_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordHidden = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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

  void showHideText(type) {
    setState(() {
      if (type == "password") {
        _isPasswordHidden = !_isPasswordHidden;
      }
    });
  }

  void onLoginButtonPressed() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<LoginBloc>(context).add(
        EmailLoginEvent(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    }
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
                  'Login.',
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
                const SizedBox(height: 30),
                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Logged in successfully"),
                        ),
                      );
                      BlocProvider.of<AuthenticationBloc>(context)
                          .add(LoggedInEvent(token: state.token));
                    }
                    if (state is LoginError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return AppPrimarySoidButton(
                      onPressed: onLoginButtonPressed,
                      buttonText: "Login",
                      width: double.infinity,
                      isLoading: state is LoginLoading,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
