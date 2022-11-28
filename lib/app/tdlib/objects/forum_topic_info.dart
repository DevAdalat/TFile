part of '../tdlib_api.dart';

class ForumTopicInfo extends TdObject {
  /// Contains basic information about a forum topic
  const ForumTopicInfo({
    required this.messageThreadId,
    required this.name,
    required this.icon,
    required this.creationDate,
    required this.creatorId,
    required this.isOutgoing,
    required this.isClosed,
    this.extra,
    this.clientId,
  });

  /// [messageThreadId] Message thread identifier of the topic
  final int messageThreadId;

  /// [name] Name of the topic
  final String name;

  /// [icon] Icon of the topic
  final ForumTopicIcon icon;

  /// [creationDate] Date the topic was created
  final int creationDate;

  /// [creatorId] Identifier of the creator of the topic
  final MessageSender creatorId;

  /// [isOutgoing] True, if the topic was created by the current user
  final bool isOutgoing;

  /// [isClosed] True, if the topic is closed
  final bool isClosed;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ForumTopicInfo.fromJson(Map<String, dynamic> json) => ForumTopicInfo(
        messageThreadId: json['message_thread_id'],
        name: json['name'],
        icon: ForumTopicIcon.fromJson(json['icon']),
        creationDate: json['creation_date'],
        creatorId: MessageSender.fromJson(json['creator_id']),
        isOutgoing: json['is_outgoing'],
        isClosed: json['is_closed'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": CONSTRUCTOR,
      "message_thread_id": messageThreadId,
      "name": name,
      "icon": icon.toJson(),
      "creation_date": creationDate,
      "creator_id": creatorId.toJson(),
      "is_outgoing": isOutgoing,
      "is_closed": isClosed,
    };
  }

  ForumTopicInfo copyWith({
    int? messageThreadId,
    String? name,
    ForumTopicIcon? icon,
    int? creationDate,
    MessageSender? creatorId,
    bool? isOutgoing,
    bool? isClosed,
    dynamic extra,
    int? clientId,
  }) =>
      ForumTopicInfo(
        messageThreadId: messageThreadId ?? this.messageThreadId,
        name: name ?? this.name,
        icon: icon ?? this.icon,
        creationDate: creationDate ?? this.creationDate,
        creatorId: creatorId ?? this.creatorId,
        isOutgoing: isOutgoing ?? this.isOutgoing,
        isClosed: isClosed ?? this.isClosed,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  static const CONSTRUCTOR = 'forumTopicInfo';

  @override
  String getConstructor() => CONSTRUCTOR;
}
