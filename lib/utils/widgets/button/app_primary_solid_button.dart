import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppPrimarySoidButton extends StatelessWidget {
  const AppPrimarySoidButton({
    super.key,
    this.isLoading = false,
    required this.onPressed,
    required this.buttonText,
    required this.width,
    this.height = 48,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
  });

  final bool isLoading;
  final VoidCallback onPressed;
  final String buttonText;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            side: BorderSide(
              color: textColor == Colors.white ? backgroundColor : textColor,
              width: 2.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          backgroundColor,
        ),
        foregroundColor: WidgetStateProperty.all<Color>(
          textColor,
        ),
        elevation: WidgetStateProperty.all<double>(0),
        minimumSize: WidgetStateProperty.all(
          Size(MediaQuery.of(context).size.width * width, height),
        ),
        fixedSize: WidgetStateProperty.all(
          Size(MediaQuery.of(context).size.width * width, height),
        ),
      ),
      child: isLoading
          ? SpinKitThreeInOut(
              color: textColor,
            )
          : Text(
              buttonText,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
    );
  }
}
