import 'package:clean_architecture_rivaan_ranawat/utils/widgets/button/app_primary_solid_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RemoveParticipantDialog extends StatelessWidget {
  const RemoveParticipantDialog({super.key});

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
              "Are you sure you want to remove this user?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Are you sure you want to remove John Doe? Kicking the user allows them to rejoin with the same link, banning the user will block them from rejoining your group.",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.black45,
              ),
            ),
            const SizedBox(height: 40),
            AppPrimarySoidButton(
              onPressed: () {},
              buttonText: "Kick User",
              width: 0.7,
              backgroundColor: Colors.red[900]!,
            ),
            const SizedBox(height: 15),
            AppPrimarySoidButton(
              onPressed: () {},
              buttonText: "Ban User",
              width: 0.7,
              backgroundColor: Colors.red[900]!,
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
