import 'package:flutter/material.dart';

class FoodReportDialog extends StatelessWidget {
  FoodReportDialog({super.key});

  final List<String> buttonContent = [
    "I don't like it",
    "Tried it too many times",
    "Not an entree",
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Why do you want to hide this item?",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 5),
            ...buttonContent.map(
              (item) {
                return Column(
                  children: [
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          backgroundColor: WidgetStateProperty.all<Color>(
                            Colors.grey[100]!,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
