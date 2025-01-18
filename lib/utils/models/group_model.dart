class GetAllGroupsParams {
  final int page;
  final int size;

  GetAllGroupsParams({
    required this.page,
    required this.size,
  });
}

class UpdateGroupDetailsParams {
  final String groupId;
  final String groupName;
  final String city;
  final String state;

  UpdateGroupDetailsParams({
    required this.groupId,
    required this.groupName,
    required this.city,
    required this.state,
  });
}
