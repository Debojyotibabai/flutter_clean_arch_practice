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

class CreatorEntity {
  final String? creatorId;
  final String? firstName;
  final String? lastName;

  CreatorEntity({
    this.creatorId,
    this.firstName,
    this.lastName,
  });
}

class GroupEntity {
  final String? groupId;
  final CreatorEntity? creator;
  final String? uniqueGroupIdentifier;
  final String? groupName;
  final String? state;
  final String? city;
  final DateTime? createdAt;

  GroupEntity({
    this.groupId,
    this.creator,
    this.uniqueGroupIdentifier,
    this.groupName,
    this.state,
    this.city,
    this.createdAt,
  });
}

class GetAllGroupsEntity {
  final PaginationEntity? pagination;
  final List<GroupEntity>? groups;
  final String? message;

  GetAllGroupsEntity({
    this.pagination,
    this.groups,
    this.message,
  });
}
