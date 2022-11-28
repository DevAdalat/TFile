part of '../tdlib_api.dart';

class CreateNewStickerSet extends TdFunction {
  /// Creates a new sticker set. Returns the newly created sticker set
  const CreateNewStickerSet({
    required this.userId,
    required this.title,
    required this.name,
    required this.stickerType,
    required this.stickers,
    required this.source,
  });

  /// [userId] Sticker set owner; ignored for regular users
  final int userId;

  /// [title] Sticker set title; 1-64 characters
  final String title;

  /// [name] Sticker set name. Can contain only English letters, digits and underscores. Must end with *"_by_
  final String name;

  /// [stickerType] Type of the stickers in the set
  final StickerType stickerType;

  /// [stickers] List of stickers to be added to the set; must be non-empty. All stickers must have the same format. For TGS stickers, uploadStickerFile must be used before the sticker is shown
  final List<InputSticker> stickers;

  /// [source] Source of the sticker set; may be empty if unknown
  final String source;

  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": CONSTRUCTOR,
      "user_id": userId,
      "title": title,
      "name": name,
      "sticker_type": stickerType.toJson(),
      "stickers": stickers.map((i) => i.toJson()).toList(),
      "source": source,
      "@extra": extra,
    };
  }

  CreateNewStickerSet copyWith({
    int? userId,
    String? title,
    String? name,
    StickerType? stickerType,
    List<InputSticker>? stickers,
    String? source,
  }) =>
      CreateNewStickerSet(
        userId: userId ?? this.userId,
        title: title ?? this.title,
        name: name ?? this.name,
        stickerType: stickerType ?? this.stickerType,
        stickers: stickers ?? this.stickers,
        source: source ?? this.source,
      );

  static const CONSTRUCTOR = 'createNewStickerSet';

  @override
  String getConstructor() => CONSTRUCTOR;
}
