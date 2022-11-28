part of '../tdlib_api.dart';

class UserFullInfo extends TdObject {
  /// Contains full information about a user
  const UserFullInfo({
    this.photo,
    required this.isBlocked,
    required this.canBeCalled,
    required this.supportsVideoCalls,
    required this.hasPrivateCalls,
    required this.hasPrivateForwards,
    required this.hasRestrictedVoiceAndVideoNoteMessages,
    required this.needPhoneNumberPrivacyException,
    this.bio,
    required this.premiumGiftOptions,
    required this.groupInCommonCount,
    this.botInfo,
    this.extra,
    this.clientId,
  });

  /// [photo] User profile photo; may be null if empty or unknown. If non-null, then it is the same photo as in user.profile_photo and chat.photo
  final ChatPhoto? photo;

  /// [isBlocked] True, if the user is blocked by the current user
  final bool isBlocked;

  /// [canBeCalled] True, if the user can be called
  final bool canBeCalled;

  /// [supportsVideoCalls] True, if a video call can be created with the user
  final bool supportsVideoCalls;

  /// [hasPrivateCalls] True, if the user can't be called due to their privacy settings
  final bool hasPrivateCalls;

  /// [hasPrivateForwards] True, if the user can't be linked in forwarded messages due to their privacy settings
  final bool hasPrivateForwards;

  /// [hasRestrictedVoiceAndVideoNoteMessages] True, if voice and video notes can't be sent or forwarded to the user
  final bool hasRestrictedVoiceAndVideoNoteMessages;

  /// [needPhoneNumberPrivacyException] True, if the current user needs to explicitly allow to share their phone number with the user when the method addContact is used
  final bool needPhoneNumberPrivacyException;

  /// [bio] A short user bio; may be null for bots
  final FormattedText? bio;

  /// [premiumGiftOptions] The list of available options for gifting Telegram Premium to the user
  final List<PremiumPaymentOption> premiumGiftOptions;

  /// [groupInCommonCount] Number of group chats where both the other user and the current user are a member; 0 for the current user
  final int groupInCommonCount;

  /// [botInfo] For bots, information about the bot; may be null
  final BotInfo? botInfo;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UserFullInfo.fromJson(Map<String, dynamic> json) => UserFullInfo(
        photo: json['photo'] == null ? null : ChatPhoto.fromJson(json['photo']),
        isBlocked: json['is_blocked'],
        canBeCalled: json['can_be_called'],
        supportsVideoCalls: json['supports_video_calls'],
        hasPrivateCalls: json['has_private_calls'],
        hasPrivateForwards: json['has_private_forwards'],
        hasRestrictedVoiceAndVideoNoteMessages:
            json['has_restricted_voice_and_video_note_messages'],
        needPhoneNumberPrivacyException:
            json['need_phone_number_privacy_exception'],
        bio: json['bio'] == null ? null : FormattedText.fromJson(json['bio']),
        premiumGiftOptions: List<PremiumPaymentOption>.from(
            (json['premium_gift_options'] ?? [])
                .map((item) => PremiumPaymentOption.fromJson(item))
                .toList()),
        groupInCommonCount: json['group_in_common_count'],
        botInfo: json['bot_info'] == null
            ? null
            : BotInfo.fromJson(json['bot_info']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": CONSTRUCTOR,
      "photo": photo?.toJson(),
      "is_blocked": isBlocked,
      "can_be_called": canBeCalled,
      "supports_video_calls": supportsVideoCalls,
      "has_private_calls": hasPrivateCalls,
      "has_private_forwards": hasPrivateForwards,
      "has_restricted_voice_and_video_note_messages":
          hasRestrictedVoiceAndVideoNoteMessages,
      "need_phone_number_privacy_exception": needPhoneNumberPrivacyException,
      "bio": bio?.toJson(),
      "premium_gift_options":
          premiumGiftOptions.map((i) => i.toJson()).toList(),
      "group_in_common_count": groupInCommonCount,
      "bot_info": botInfo?.toJson(),
    };
  }

  UserFullInfo copyWith({
    ChatPhoto? photo,
    bool? isBlocked,
    bool? canBeCalled,
    bool? supportsVideoCalls,
    bool? hasPrivateCalls,
    bool? hasPrivateForwards,
    bool? hasRestrictedVoiceAndVideoNoteMessages,
    bool? needPhoneNumberPrivacyException,
    FormattedText? bio,
    List<PremiumPaymentOption>? premiumGiftOptions,
    int? groupInCommonCount,
    BotInfo? botInfo,
    dynamic extra,
    int? clientId,
  }) =>
      UserFullInfo(
        photo: photo ?? this.photo,
        isBlocked: isBlocked ?? this.isBlocked,
        canBeCalled: canBeCalled ?? this.canBeCalled,
        supportsVideoCalls: supportsVideoCalls ?? this.supportsVideoCalls,
        hasPrivateCalls: hasPrivateCalls ?? this.hasPrivateCalls,
        hasPrivateForwards: hasPrivateForwards ?? this.hasPrivateForwards,
        hasRestrictedVoiceAndVideoNoteMessages:
            hasRestrictedVoiceAndVideoNoteMessages ??
                this.hasRestrictedVoiceAndVideoNoteMessages,
        needPhoneNumberPrivacyException: needPhoneNumberPrivacyException ??
            this.needPhoneNumberPrivacyException,
        bio: bio ?? this.bio,
        premiumGiftOptions: premiumGiftOptions ?? this.premiumGiftOptions,
        groupInCommonCount: groupInCommonCount ?? this.groupInCommonCount,
        botInfo: botInfo ?? this.botInfo,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  static const CONSTRUCTOR = 'userFullInfo';

  @override
  String getConstructor() => CONSTRUCTOR;
}
