// To parse this JSON data, do
//
//     final editProfileDataModel = editProfileDataModelFromMap(jsonString);

import 'dart:convert';

EditProfileDataModel editProfileDataModelFromMap(String str) =>
    EditProfileDataModel.fromMap(json.decode(str));

class EditProfileDataModel {
  final UserModel? user;

  EditProfileDataModel({
    this.user,
  });

  factory EditProfileDataModel.fromMap(Map<String, dynamic> json) =>
      EditProfileDataModel(
        user: json["user"] == null ? null : UserModel.fromMap(json["user"]),
      );
}

class UserModel {
  final String? userId;
  final String? userType;
  final dynamic profilePictureUrl;
  final String? firstName;
  final String? lastName;
  final dynamic profileImage;
  final dynamic profileImageUrl;
  final String? emailAddress;
  final dynamic phoneCountryCode;
  final dynamic phoneNumber;
  final UserSettingsModel? userSettings;
  final String? accountStatus;
  final DateTime? registeredOn;
  final int? numberOfUnreadNotifications;
  final List<UserFeaturedFoodItemModel>? userFeaturedFoodItems;
  final bool? showRecommendationTip;

  UserModel({
    this.userId,
    this.userType,
    this.profilePictureUrl,
    this.firstName,
    this.lastName,
    this.profileImage,
    this.profileImageUrl,
    this.emailAddress,
    this.phoneCountryCode,
    this.phoneNumber,
    this.userSettings,
    this.accountStatus,
    this.registeredOn,
    this.numberOfUnreadNotifications,
    this.userFeaturedFoodItems,
    this.showRecommendationTip,
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

class UserFeaturedFoodItemModel {
  final String? foodId;
  final String? foodItemName;

  UserFeaturedFoodItemModel({
    this.foodId,
    this.foodItemName,
  });

  factory UserFeaturedFoodItemModel.fromMap(Map<String, dynamic> json) =>
      UserFeaturedFoodItemModel(
        foodId: json["foodId"],
        foodItemName: json["foodItemName"],
      );
}

class UserSettingsModel {
  final bool? isAvailable;
  final bool? isProfileCompleted;
  final bool? needToChangePassword;
  final int? recommendationTipCount;
  final bool? dismissRecommendationTip;
  final DateTime? recommendationTipLastShowTime;

  UserSettingsModel({
    this.isAvailable,
    this.isProfileCompleted,
    this.needToChangePassword,
    this.recommendationTipCount,
    this.dismissRecommendationTip,
    this.recommendationTipLastShowTime,
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
