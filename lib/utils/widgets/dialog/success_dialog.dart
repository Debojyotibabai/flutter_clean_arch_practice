import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key, required this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Success!",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              message ?? "Your rating has been saved!",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
