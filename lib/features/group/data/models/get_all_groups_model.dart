// To parse this JSON data, do
//
//     final getAllGroupsModel = getAllGroupsModelFromMap(jsonString);

import 'dart:convert';

import 'package:clean_architecture_rivaan_ranawat/features/group/domain/entities/get_all_groups_entity.dart';

GetAllGroupsModel getAllGroupsModelFromMap(String str) =>
    GetAllGroupsModel.fromMap(json.decode(str));

class GetAllGroupsModel extends GetAllGroupsEntity {
  GetAllGroupsModel({
    super.pagination,
    super.groups,
    super.message,
  });

  factory GetAllGroupsModel.fromMap(Map<String, dynamic> json) =>
      GetAllGroupsModel(
        pagination: json["pagination"] == null
            ? null
            : PaginationModel.fromMap(json["pagination"]),
        groups: json["groups"] == null
            ? []
            : List<GroupModel>.from(
                json["groups"]!.map((x) => GroupModel.fromMap(x))),
        message: json["message"],
      );
}

class GroupModel extends GroupEntity {
  GroupModel({
    super.groupId,
    super.creator,
    super.uniqueGroupIdentifier,
    super.groupName,
    super.state,
    super.city,
    super.createdAt,
  });

  factory GroupModel.fromMap(Map<String, dynamic> json) => GroupModel(
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

class PaginationModel extends PaginationEntity {
  PaginationModel({
    super.totalItems,
    super.perPage,
    super.currentPage,
    super.lastPage,
  });

  factory PaginationModel.fromMap(Map<String, dynamic> json) => PaginationModel(
        totalItems: json["totalItems"],
        perPage: json["perPage"],
        currentPage: json["currentPage"],
        lastPage: json["lastPage"],
      );
}
