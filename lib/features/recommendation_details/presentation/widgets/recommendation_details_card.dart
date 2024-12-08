import 'package:clean_architecture_rivaan_ranawat/utils/rating_color_generator.dart';
import 'package:flutter/material.dart';

class RecommendationDetailsCard extends StatelessWidget {
  const RecommendationDetailsCard({
    super.key,
    this.index,
    this.foodName,
    this.rating,
    this.price,
  });

  final int? index;
  final String? foodName;
  final double? rating;
  final double? price;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                index != null
                    ? Row(
                        children: [
                          Text(
                            index.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[900],
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(width: 15),
                        ],
                      )
                    : Container(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 275),
                      child: Text(
                        foodName!,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          constraints: const BoxConstraints(maxWidth: 150),
                          child: Text(
                            "$rating% match",
                            style: TextStyle(
                              color: ratingColorGenerator(rating: rating!) ==
                                      "good"
                                  ? Colors.green[600]
                                  : ratingColorGenerator(rating: rating!) ==
                                          "average"
                                      ? Colors.yellow[800]
                                      : Colors.red[500],
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
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
                            Icon(
                              Icons.currency_exchange,
                              color: Colors.green[900],
                              size: 16,
                            ),
                            const SizedBox(width: 5),
                            Container(
                              constraints: const BoxConstraints(maxWidth: 160),
                              child: Text(
                                "\$$price",
                                style: TextStyle(
                                  color: Colors.green[900],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.star,
              color: Colors.yellow[700],
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
