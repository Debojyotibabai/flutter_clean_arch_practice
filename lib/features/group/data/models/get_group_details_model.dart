// To parse this JSON data, do
//
//     final getGroupDetailsModel = getGroupDetailsModelFromMap(jsonString);

import 'dart:convert';

import 'package:clean_architecture_rivaan_ranawat/features/group/domain/entities/get_group_details_entity.dart';

GetGroupDetailsModel getGroupDetailsModelFromMap(String str) =>
    GetGroupDetailsModel.fromMap(json.decode(str));

class GetGroupDetailsModel extends GetGroupDetailsEntity {
  GetGroupDetailsModel({
    super.groupId,
    super.creator,
    super.uniqueGroupIdentifier,
    super.groupName,
    super.state,
    super.city,
    super.createdAt,
  });

  factory GetGroupDetailsModel.fromMap(Map<String, dynamic> json) =>
      GetGroupDetailsModel(
        groupId: json["groupId"],
        creator: json["creator"] == null
            ? null
            : CreatorModel.fromMap(json["creator"]),
        uniqueGroupIdentifier: json["uniqueGroupIdentifier"],
        groupName: json["groupName"],
        state: json["state"],
        city: json["city"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );
}

class CreatorModel extends CreatorEntity {
  CreatorModel({
    super.creatorId,
    super.firstName,
    super.lastName,
  });

  factory CreatorModel.fromMap(Map<String, dynamic> json) => CreatorModel(
        creatorId: json["creatorId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );
}
