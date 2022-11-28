part of '../tdlib_api.dart';

class ToggleBotIsAddedToAttachmentMenu extends TdFunction {
  /// Adds or removes a bot to attachment menu. Bot can be added to attachment menu, only if userTypeBot.can_be_added_to_attachment_menu == true
  const ToggleBotIsAddedToAttachmentMenu({
    required this.botUserId,
    required this.isAdded,
  });

  /// [botUserId] Bot's user identifier
  final int botUserId;

  /// [isAdded] Pass true to add the bot to attachment menu; pass false to remove the bot from attachment menu
  final bool isAdded;

  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": CONSTRUCTOR,
      "bot_user_id": botUserId,
      "is_added": isAdded,
      "@extra": extra,
    };
  }

  ToggleBotIsAddedToAttachmentMenu copyWith({
    int? botUserId,
    bool? isAdded,
  }) =>
      ToggleBotIsAddedToAttachmentMenu(
        botUserId: botUserId ?? this.botUserId,
        isAdded: isAdded ?? this.isAdded,
      );

  static const CONSTRUCTOR = 'toggleBotIsAddedToAttachmentMenu';

  @override
  String getConstructor() => CONSTRUCTOR;
}
