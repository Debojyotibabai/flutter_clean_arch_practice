// To parse this JSON data, do
//
//     final editProfileDataModel = editProfileDataModelFromMap(jsonString);

import 'dart:convert';

import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/domain/entities/edit_profile_data_entity.dart';

EditProfileDataModel editProfileDataModelFromMap(String str) =>
    EditProfileDataModel.fromMap(json.decode(str));

class EditProfileDataModel extends EditProfileDataEntity {
  EditProfileDataModel({
    super.user,
  });

  factory EditProfileDataModel.fromMap(Map<String, dynamic> json) =>
      EditProfileDataModel(
        user: json["user"] == null ? null : UserModel.fromMap(json["user"]),
      );
}

class UserModel extends UserEntity {
  UserModel({
    super.userId,
    super.userType,
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
    super.userFeaturedFoodItems,
    super.showRecommendationTip,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        userId: json["userId"],
        userType: json["userType"],
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
        userFeaturedFoodItems: json["userFeaturedFoodItems"] == null
            ? []
            : List<UserFeaturedFoodItemModel>.from(
                json["userFeaturedFoodItems"]!
                    .map((x) => UserFeaturedFoodItemModel.fromMap(x))),
        showRecommendationTip: json["showRecommendationTip"],
      );
}

class UserFeaturedFoodItemModel extends UserFeaturedFoodItemEntity {
  UserFeaturedFoodItemModel({
    super.foodId,
    super.foodItemName,
  });

  factory UserFeaturedFoodItemModel.fromMap(Map<String, dynamic> json) =>
      UserFeaturedFoodItemModel(
        foodId: json["foodId"],
        foodItemName: json["foodItemName"],
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
