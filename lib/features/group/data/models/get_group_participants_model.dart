// To parse this JSON data, do
//
//     final getGroupParticipantsModel = getGroupParticipantsModelFromMap(jsonString);

import 'dart:convert';

import 'package:clean_architecture_rivaan_ranawat/features/group/domain/entities/get_group_participants_entity.dart';

GetGroupParticipantsModel getGroupParticipantsModelFromMap(String str) =>
    GetGroupParticipantsModel.fromMap(json.decode(str));

class GetGroupParticipantsModel extends GetGroupParticipantsEntity {
  GetGroupParticipantsModel({
    super.groupMembers,
    super.message,
  });

  factory GetGroupParticipantsModel.fromMap(Map<String, dynamic> json) =>
      GetGroupParticipantsModel(
        groupMembers: json["groupMembers"] == null
            ? []
            : List<GroupMemberModel>.from(
                json["groupMembers"]!.map((x) => GroupMemberModel.fromMap(x))),
        message: json["message"],
      );
}

class GroupMemberModel extends GroupMemberEntity {
  GroupMemberModel({
    super.userId,
    super.userType,
    super.profilePicture,
    super.profilePictureUrl,
    super.firstName,
    super.lastName,
    super.profileImage,
    super.profileImageUrl,
    super.emailAddress,
    super.phoneCountryCode,
    super.phoneNumber,
    super.userSettings,
    super.accountStatus,
    super.registeredOn,
    super.numberOfUnreadNotifications,
    super.showRecommendationTip,
    super.groupMemberId,
    super.userRole,
    super.status,
  });

  factory GroupMemberModel.fromMap(Map<String, dynamic> json) =>
      GroupMemberModel(
        userId: json["userId"],
        userType: json["userType"],
        profilePicture: json["profilePicture"],
        profilePictureUrl: json["profilePictureUrl"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        profileImage: json["profileImage"],
        profileImageUrl: json["profile_image_url"],
        emailAddress: json["emailAddress"],
        phoneCountryCode: json["phoneCountryCode"],
        phoneNumber: json["phoneNumber"],
        userSettings: json["userSettings"] == null
            ? null
            : UserSettingsModel.fromMap(json["userSettings"]),
        accountStatus: json["accountStatus"],
        registeredOn: json["registeredOn"] == null
            ? null
            : DateTime.parse(json["registeredOn"]),
        numberOfUnreadNotifications: json["numberOfUnreadNotifications"],
        showRecommendationTip: json["showRecommendationTip"],
        groupMemberId: json["groupMemberId"],
        userRole: json["userRole"],
        status: json["status"],
      );
}

class UserSettingsModel extends UserSettingsEntity {
  UserSettingsModel({
    super.isAvailable,
    super.isProfileCompleted,
    super.needToChangePassword,
    super.recommendationTipCount,
    super.dismissRecommendationTip,
    super.recommendationTipLastShowTime,
  });

  factory UserSettingsModel.fromMap(Map<String, dynamic> json) =>
      UserSettingsModel(
        isAvailable: json["isAvailable"],
        isProfileCompleted: json["isProfileCompleted"],
        needToChangePassword: json["needToChangePassword"],
        recommendationTipCount: json["recommendationTipCount"],
        dismissRecommendationTip: json["dismissRecommendationTip"],
        recommendationTipLastShowTime:
            json["recommendationTipLastShowTime"] == null
                ? null
                : DateTime.parse(json["recommendationTipLastShowTime"]),
      );
}
