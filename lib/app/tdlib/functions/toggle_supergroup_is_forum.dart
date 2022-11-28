part of '../tdlib_api.dart';

class ToggleSupergroupIsForum extends TdFunction {
  /// Toggles whether the supergroup is a forum; requires owner privileges in the supergroup
  const ToggleSupergroupIsForum({
    required this.supergroupId,
    required this.isForum,
  });

  /// [supergroupId] Identifier of the supergroup
  final int supergroupId;

  /// [isForum] New value of is_forum. A supergroup can be converted to a forum, only if it has at least GetOption("forum_member_count_min") members
  final bool isForum;

  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": CONSTRUCTOR,
      "supergroup_id": supergroupId,
      "is_forum": isForum,
      "@extra": extra,
    };
  }

  ToggleSupergroupIsForum copyWith({
    int? supergroupId,
    bool? isForum,
  }) =>
      ToggleSupergroupIsForum(
        supergroupId: supergroupId ?? this.supergroupId,
        isForum: isForum ?? this.isForum,
      );

  static const CONSTRUCTOR = 'toggleSupergroupIsForum';

  @override
  String getConstructor() => CONSTRUCTOR;
}
