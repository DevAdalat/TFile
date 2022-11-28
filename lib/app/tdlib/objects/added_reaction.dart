part of '../tdlib_api.dart';

class AddedReaction extends TdObject {
  /// Represents a reaction applied to a message
  const AddedReaction({
    required this.type,
    required this.senderId,
  });

  /// [type] Type of the reaction
  final ReactionType type;

  /// [senderId] Identifier of the chat member, applied the reaction
  final MessageSender senderId;

  /// Parse from a json
  factory AddedReaction.fromJson(Map<String, dynamic> json) => AddedReaction(
        type: ReactionType.fromJson(json['type']),
        senderId: MessageSender.fromJson(json['sender_id']),
      );

  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": CONSTRUCTOR,
      "type": type.toJson(),
      "sender_id": senderId.toJson(),
    };
  }

  AddedReaction copyWith({
    ReactionType? type,
    MessageSender? senderId,
  }) =>
      AddedReaction(
        type: type ?? this.type,
        senderId: senderId ?? this.senderId,
      );

  static const CONSTRUCTOR = 'addedReaction';

  @override
  String getConstructor() => CONSTRUCTOR;
}
