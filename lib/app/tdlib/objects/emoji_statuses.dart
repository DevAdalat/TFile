part of '../tdlib_api.dart';

class EmojiStatuses extends TdObject {
  /// Contains a list of emoji statuses
  const EmojiStatuses({
    required this.emojiStatuses,
    this.extra,
    this.clientId,
  });

  /// [emojiStatuses] The list of emoji statuses
  final List<EmojiStatus> emojiStatuses;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory EmojiStatuses.fromJson(Map<String, dynamic> json) => EmojiStatuses(
        emojiStatuses: List<EmojiStatus>.from((json['emoji_statuses'] ?? [])
            .map((item) => EmojiStatus.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": CONSTRUCTOR,
      "emoji_statuses": emojiStatuses.map((i) => i.toJson()).toList(),
    };
  }

  EmojiStatuses copyWith({
    List<EmojiStatus>? emojiStatuses,
    dynamic extra,
    int? clientId,
  }) =>
      EmojiStatuses(
        emojiStatuses: emojiStatuses ?? this.emojiStatuses,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  static const CONSTRUCTOR = 'emojiStatuses';

  @override
  String getConstructor() => CONSTRUCTOR;
}
