part of '../tdlib_api.dart';

class EditForumTopic extends TdFunction {
  /// Edits title and icon of a topic in a forum supergroup chat; requires can_manage_topics administrator rights in the supergroup unless the user is creator of the topic
  const EditForumTopic({
    required this.chatId,
    required this.messageThreadId,
    required this.name,
    required this.iconCustomEmojiId,
  });

  /// [chatId] Identifier of the chat
  final int chatId;

  /// [messageThreadId] Message thread identifier of the forum topic
  final int messageThreadId;

  /// [name] New name of the topic; 1-128 characters
  final String name;

  /// [iconCustomEmojiId] Identifier of the new custom emoji for topic icon. Telegram Premium users can use any custom emoji, other users can use only a custom emoji returned by getForumTopicDefaultIcons
  final int iconCustomEmojiId;

  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_thread_id": messageThreadId,
      "name": name,
      "icon_custom_emoji_id": iconCustomEmojiId,
      "@extra": extra,
    };
  }

  EditForumTopic copyWith({
    int? chatId,
    int? messageThreadId,
    String? name,
    int? iconCustomEmojiId,
  }) =>
      EditForumTopic(
        chatId: chatId ?? this.chatId,
        messageThreadId: messageThreadId ?? this.messageThreadId,
        name: name ?? this.name,
        iconCustomEmojiId: iconCustomEmojiId ?? this.iconCustomEmojiId,
      );

  static const CONSTRUCTOR = 'editForumTopic';

  @override
  String getConstructor() => CONSTRUCTOR;
}
