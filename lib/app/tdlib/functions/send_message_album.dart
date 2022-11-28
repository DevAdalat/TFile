part of '../tdlib_api.dart';

class SendMessageAlbum extends TdFunction {
  /// Sends 2-10 messages grouped together into an album. Currently, only audio, document, photo and video messages can be grouped into an album. Documents and audio files can be only grouped in an album with messages of the same type. Returns sent messages
  const SendMessageAlbum({
    required this.chatId,
    required this.messageThreadId,
    required this.replyToMessageId,
    this.options,
    required this.inputMessageContents,
    required this.onlyPreview,
  });

  /// [chatId] Target chat
  final int chatId;

  /// [messageThreadId] If not 0, a message thread identifier in which the messages will be sent
  final int messageThreadId;

  /// [replyToMessageId] Identifier of a replied message; 0 if none
  final int replyToMessageId;

  /// [options] Options to be used to send the messages; pass null to use default options
  final MessageSendOptions? options;

  /// [inputMessageContents] Contents of messages to be sent. At most 10 messages can be added to an album
  final List<InputMessageContent> inputMessageContents;

  /// [onlyPreview] Pass true to get fake messages instead of actually sending them
  final bool onlyPreview;

  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_thread_id": messageThreadId,
      "reply_to_message_id": replyToMessageId,
      "options": options?.toJson(),
      "input_message_contents":
          inputMessageContents.map((i) => i.toJson()).toList(),
      "only_preview": onlyPreview,
      "@extra": extra,
    };
  }

  SendMessageAlbum copyWith({
    int? chatId,
    int? messageThreadId,
    int? replyToMessageId,
    MessageSendOptions? options,
    List<InputMessageContent>? inputMessageContents,
    bool? onlyPreview,
  }) =>
      SendMessageAlbum(
        chatId: chatId ?? this.chatId,
        messageThreadId: messageThreadId ?? this.messageThreadId,
        replyToMessageId: replyToMessageId ?? this.replyToMessageId,
        options: options ?? this.options,
        inputMessageContents: inputMessageContents ?? this.inputMessageContents,
        onlyPreview: onlyPreview ?? this.onlyPreview,
      );

  static const CONSTRUCTOR = 'sendMessageAlbum';

  @override
  String getConstructor() => CONSTRUCTOR;
}
