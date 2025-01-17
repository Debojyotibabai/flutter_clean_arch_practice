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

class GetGroupDetailsEntity {
  final String? groupId;
  final CreatorEntity? creator;
  final String? uniqueGroupIdentifier;
  final String? groupName;
  final String? state;
  final String? city;
  final DateTime? createdAt;

  GetGroupDetailsEntity({
    this.groupId,
    this.creator,
    this.uniqueGroupIdentifier,
    this.groupName,
    this.state,
    this.city,
    this.createdAt,
  });
}
