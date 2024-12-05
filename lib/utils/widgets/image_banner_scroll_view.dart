import 'package:clean_architecture_rivaan_ranawat/assets/images.dart';
import 'package:flutter/material.dart';

class ImageBannerScrollView extends StatelessWidget {
  const ImageBannerScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          child: Image.asset(
            Images.rollImage,
            height: 190,
            width: 190,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
