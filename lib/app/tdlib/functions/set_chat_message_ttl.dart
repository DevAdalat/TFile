part of '../tdlib_api.dart';

class SetChatMessageTtl extends TdFunction {
  /// Changes the message TTL in a chat. Requires can_delete_messages administrator right in basic groups, supergroups and channels. Message TTL can't be changed in a chat with the current user (Saved Messages) and the chat 777000 (Telegram).
  const SetChatMessageTtl({
    required this.chatId,
    required this.ttl,
  });

  /// [chatId] Chat identifier
  final int chatId;

  /// [ttl] New TTL value, in seconds; unless the chat is secret, it must be from 0 up to 365 * 86400 and be divisible by 86400
  final int ttl;

  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "ttl": ttl,
      "@extra": extra,
    };
  }

  SetChatMessageTtl copyWith({
    int? chatId,
    int? ttl,
  }) =>
      SetChatMessageTtl(
        chatId: chatId ?? this.chatId,
        ttl: ttl ?? this.ttl,
      );

  static const CONSTRUCTOR = 'setChatMessageTtl';

  @override
  String getConstructor() => CONSTRUCTOR;
}
