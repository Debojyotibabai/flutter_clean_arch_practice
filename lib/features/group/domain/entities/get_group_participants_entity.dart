class UserSettingsEntity {
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

class GroupMemberEntity {
  final String? userId;
  final String? userType;
  final dynamic profilePicture;
  final dynamic profilePictureUrl;
  final String? firstName;
  final String? lastName;
  final dynamic profileImage;
  final dynamic profileImageUrl;
  final String? emailAddress;
  final String? phoneCountryCode;
  final String? phoneNumber;
  final UserSettingsEntity? userSettings;
  final String? accountStatus;
  final DateTime? registeredOn;
  final int? numberOfUnreadNotifications;
  final bool? showRecommendationTip;
  final String? groupMemberId;
  final String? userRole;
  final String? status;

  GroupMemberEntity({
    this.userId,
    this.userType,
    this.profilePicture,
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
    this.showRecommendationTip,
    this.groupMemberId,
    this.userRole,
    this.status,
  });
}

class GetGroupParticipantsEntity {
  final List<GroupMemberEntity>? groupMembers;
  final String? message;

  GetGroupParticipantsEntity({
    this.groupMembers,
    this.message,
  });
}
