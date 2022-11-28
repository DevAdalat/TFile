part of '../tdlib_api.dart';

class Sticker extends TdObject {
  /// Describes a sticker
  const Sticker({
    required this.setId,
    required this.width,
    required this.height,
    required this.emoji,
    required this.format,
    required this.type,
    this.maskPosition,
    required this.customEmojiId,
    required this.outline,
    this.thumbnail,
    required this.isPremium,
    this.premiumAnimation,
    required this.sticker,
    this.extra,
    this.clientId,
  });

  /// [setId] The identifier of the sticker set to which the sticker belongs; 0 if none
  final int setId;

  /// [width] Sticker width; as defined by the sender
  final int width;

  /// [height] Sticker height; as defined by the sender
  final int height;

  /// [emoji] Emoji corresponding to the sticker
  final String emoji;

  /// [format] Sticker format
  final StickerFormat format;

  /// [type] Sticker type
  final StickerType type;

  /// [maskPosition] Position where the mask is placed; may be null even the sticker is a mask
  final MaskPosition? maskPosition;

  /// [customEmojiId] Identifier of the emoji if the sticker is a custom emoji
  final int customEmojiId;

  /// [outline] Sticker's outline represented as a list of closed vector paths; may be empty. The coordinate system origin is in the upper-left corner
  final List<ClosedVectorPath> outline;

  /// [thumbnail] Sticker thumbnail in WEBP or JPEG format; may be null
  final Thumbnail? thumbnail;

  /// [isPremium] True, if only Premium users can use the sticker
  final bool isPremium;

  /// [premiumAnimation] Premium animation of the sticker; may be null
  final File? premiumAnimation;

  /// [sticker] File containing the sticker
  final File sticker;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory Sticker.fromJson(Map<String, dynamic> json) => Sticker(
        setId: int.tryParse(json['set_id'] ?? "") ?? 0,
        width: json['width'],
        height: json['height'],
        emoji: json['emoji'],
        format: StickerFormat.fromJson(json['format']),
        type: StickerType.fromJson(json['type']),
        maskPosition: json['mask_position'] == null
            ? null
            : MaskPosition.fromJson(json['mask_position']),
        customEmojiId: int.parse(json['custom_emoji_id']),
        outline: List<ClosedVectorPath>.from((json['outline'] ?? [])
            .map((item) => ClosedVectorPath.fromJson(item))
            .toList()),
        thumbnail: json['thumbnail'] == null
            ? null
            : Thumbnail.fromJson(json['thumbnail']),
        isPremium: json['is_premium'],
        premiumAnimation: json['premium_animation'] == null
            ? null
            : File.fromJson(json['premium_animation']),
        sticker: File.fromJson(json['sticker']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": CONSTRUCTOR,
      "set_id": setId,
      "width": width,
      "height": height,
      "emoji": emoji,
      "format": format.toJson(),
      "type": type.toJson(),
      "mask_position": maskPosition?.toJson(),
      "custom_emoji_id": customEmojiId,
      "outline": outline.map((i) => i.toJson()).toList(),
      "thumbnail": thumbnail?.toJson(),
      "is_premium": isPremium,
      "premium_animation": premiumAnimation?.toJson(),
      "sticker": sticker.toJson(),
    };
  }

  Sticker copyWith({
    int? setId,
    int? width,
    int? height,
    String? emoji,
    StickerFormat? format,
    StickerType? type,
    MaskPosition? maskPosition,
    int? customEmojiId,
    List<ClosedVectorPath>? outline,
    Thumbnail? thumbnail,
    bool? isPremium,
    File? premiumAnimation,
    File? sticker,
    dynamic extra,
    int? clientId,
  }) =>
      Sticker(
        setId: setId ?? this.setId,
        width: width ?? this.width,
        height: height ?? this.height,
        emoji: emoji ?? this.emoji,
        format: format ?? this.format,
        type: type ?? this.type,
        maskPosition: maskPosition ?? this.maskPosition,
        customEmojiId: customEmojiId ?? this.customEmojiId,
        outline: outline ?? this.outline,
        thumbnail: thumbnail ?? this.thumbnail,
        isPremium: isPremium ?? this.isPremium,
        premiumAnimation: premiumAnimation ?? this.premiumAnimation,
        sticker: sticker ?? this.sticker,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  static const CONSTRUCTOR = 'sticker';

  @override
  String getConstructor() => CONSTRUCTOR;
}
