import 'package:clean_architecture_rivaan_ranawat/utils/rating_color_generator.dart';
import 'package:flutter/material.dart';

class GroupRecommendationCard extends StatelessWidget {
  const GroupRecommendationCard({
    super.key,
    required this.restaurantName,
    required this.distance,
    required this.groupMatch,
    required this.foodName,
    required this.onTap,
  });

  final String restaurantName;
  final double distance;
  final double groupMatch;
  final String foodName;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 230,
                    ),
                    child: Text(
                      restaurantName,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_pin,
                        color: Colors.grey,
                        size: 16,
                      ),
                      Container(
                        constraints: const BoxConstraints(maxWidth: 90),
                        child: Text(
                          "${distance.toStringAsFixed(2)} mi",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "${groupMatch.toStringAsFixed(2)}% group match",
                style: TextStyle(
                  color: ratingColorGenerator(rating: groupMatch) == "good"
                      ? Colors.green[600]
                      : ratingColorGenerator(rating: groupMatch) == "average"
                          ? Colors.yellow[800]
                          : Colors.red[500],
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                foodName,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
