class PaginationEntity {
  final int? totalItems;
  final int? perPage;
  final int? currentPage;
  final int? lastPage;

  PaginationEntity({
    this.totalItems,
    this.perPage,
    this.currentPage,
    this.lastPage,
  });
}

class GetGroupRecommendationsEntity {
  final String? message;
  final PaginationEntity? pagination;
  final List<dynamic>? restaurantRecommendations;

  GetGroupRecommendationsEntity({
    this.message,
    this.pagination,
    this.restaurantRecommendations,
  });
}
