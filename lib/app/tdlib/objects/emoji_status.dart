part of '../tdlib_api.dart';

class EmojiStatus extends TdObject {
  /// Describes a custom emoji to be shown instead of the Telegram Premium badge
  const EmojiStatus({
    required this.customEmojiId,
  });

  /// [customEmojiId] Identifier of the custom emoji in stickerFormatTgs format. If the custom emoji belongs to the sticker set GetOption("themed_emoji_statuses_sticker_set_id"), then it's color must be changed to the color of the Telegram Premium badge
  final int customEmojiId;

  /// Parse from a json
  factory EmojiStatus.fromJson(Map<String, dynamic> json) => EmojiStatus(
        customEmojiId: int.parse(json['custom_emoji_id']),
      );

  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": CONSTRUCTOR,
      "custom_emoji_id": customEmojiId,
    };
  }

  EmojiStatus copyWith({
    int? customEmojiId,
  }) =>
      EmojiStatus(
        customEmojiId: customEmojiId ?? this.customEmojiId,
      );

  static const CONSTRUCTOR = 'emojiStatus';

  @override
  String getConstructor() => CONSTRUCTOR;
}
