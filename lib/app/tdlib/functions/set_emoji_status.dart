part of '../tdlib_api.dart';

class SetEmojiStatus extends TdFunction {
  /// Changes the emoji status of the current user; for Telegram Premium users only
  const SetEmojiStatus({
    this.emojiStatus,
    required this.duration,
  });

  /// [emojiStatus] New emoji status; pass null to switch to the default badge
  final EmojiStatus? emojiStatus;

  /// [duration] Duration of the status, in seconds; pass 0 to keep the status active until it will be changed manually
  final int duration;

  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": CONSTRUCTOR,
      "emoji_status": emojiStatus?.toJson(),
      "duration": duration,
      "@extra": extra,
    };
  }

  SetEmojiStatus copyWith({
    EmojiStatus? emojiStatus,
    int? duration,
  }) =>
      SetEmojiStatus(
        emojiStatus: emojiStatus ?? this.emojiStatus,
        duration: duration ?? this.duration,
      );

  static const CONSTRUCTOR = 'setEmojiStatus';

  @override
  String getConstructor() => CONSTRUCTOR;
}
