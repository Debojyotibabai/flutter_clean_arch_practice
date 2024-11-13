class RecommendedFoodsSortByOption {
  RecommendedFoodsSortByOption(
      {required this.label, required this.value, required this.order});

  final String label;
  final String value;
  final String order;
}

abstract class Constants {
  static final List<RecommendedFoodsSortByOption>
      recommendedFoodsSortByOptions = [
    RecommendedFoodsSortByOption(
      label: 'Price: High to Low',
      value: 'price',
      order: "desc",
    ),
    RecommendedFoodsSortByOption(
      label: 'Price: Low to High',
      value: 'price',
      order: "asc",
    ),
    RecommendedFoodsSortByOption(
      label: 'Distance',
      value: 'distance',
      order: "asc",
    ),
    RecommendedFoodsSortByOption(
      label: 'Best Match',
      value: 'best-match',
      order: "desc",
    ),
    RecommendedFoodsSortByOption(
      label: 'Try it Again',
      value: 'try-it-again',
      order: "desc",
    ),
  ];
}
