import 'package:clean_architecture_rivaan_ranawat/utils/widgets/button/app_primary_solid_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.subTitle,
    required this.confirmButtonText,
    this.onConfirm,
    this.disableConfirmationButton = false,
  });

  final String? title;
  final String? subTitle;
  final String? confirmButtonText;
  final void Function()? onConfirm;
  final bool disableConfirmationButton;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              subTitle!,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.black45,
              ),
            ),
            const SizedBox(height: 40),
            AppPrimarySoidButton(
              onPressed: onConfirm ?? () {},
              buttonText: confirmButtonText!,
              width: 0.7,
              backgroundColor: Colors.red[900]!,
              isLoading: disableConfirmationButton,
            ),
            const SizedBox(height: 15),
            AppPrimarySoidButton(
              onPressed: () {
                context.pop();
              },
              buttonText: "Cancel",
              width: 0.7,
              backgroundColor: Colors.white,
              textColor: Colors.green[800]!,
            ),
          ],
        ),
      ),
    );
  }
}
