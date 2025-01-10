import 'package:flutter/material.dart';

class GroupListingCard extends StatelessWidget {
  final String groupName;
  final String creatorName;

  const GroupListingCard({
    super.key,
    required this.groupName,
    required this.creatorName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 260),
                  child: Text(
                    groupName,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 260),
                  child: Text(
                    creatorName,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black45,
                    ),
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }
}
