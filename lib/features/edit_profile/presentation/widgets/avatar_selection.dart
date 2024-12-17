import 'package:clean_architecture_rivaan_ranawat/assets/images.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/button/app_primary_solid_button.dart';
import 'package:flutter/material.dart';

class AvatarSelection extends StatelessWidget {
  final String avatarImage;

  const AvatarSelection({super.key, required this.avatarImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Select your avatar",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AppPrimarySoidButton(
                  onPressed: () {},
                  buttonText: "Select from Gallery",
                  width: 0.6,
                  backgroundColor: Colors.red[900]!,
                ),
                const SizedBox(
                  height: 15,
                ),
                AppPrimarySoidButton(
                  onPressed: () {},
                  buttonText: "Open Camera",
                  width: 0.5,
                  backgroundColor: Colors.red[900]!,
                ),
              ],
            ),
          ),
        ),
      ),
      child: Stack(
        children: [
          avatarImage != ""
              ? Image.network(avatarImage)
              : Image.asset(Images.avatarImage),
          Positioned(
            bottom: 5,
            right: 0,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.red[900],
              ),
              child: const Center(
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
