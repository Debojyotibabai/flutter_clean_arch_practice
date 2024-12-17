abstract class UserSettingsEntity {
  final bool? isAvailable;
  final bool? isProfileCompleted;
  final bool? needToChangePassword;
  final int? recommendationTipCount;
  final bool? dismissRecommendationTip;
  final DateTime? recommendationTipLastShowTime;

  UserSettingsEntity({
    this.isAvailable,
    this.isProfileCompleted,
    this.needToChangePassword,
    this.recommendationTipCount,
    this.dismissRecommendationTip,
    this.recommendationTipLastShowTime,
  });
}

abstract class UserFeaturedFoodItemEntity {
  final String? foodId;
  final String? foodItemName;

  UserFeaturedFoodItemEntity({
    this.foodId,
    this.foodItemName,
  });
}

abstract class UserEntity {
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
  final UserSettingsEntity? userSettings;
  final String? accountStatus;
  final DateTime? registeredOn;
  final int? numberOfUnreadNotifications;
  final List<UserFeaturedFoodItemEntity>? userFeaturedFoodItems;
  final bool? showRecommendationTip;

  UserEntity({
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
}

abstract class EditProfileDataEntity {
  final UserEntity? user;

  EditProfileDataEntity({
    this.user,
  });
}
