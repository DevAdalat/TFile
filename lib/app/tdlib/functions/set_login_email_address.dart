part of '../tdlib_api.dart';

class SetLoginEmailAddress extends TdFunction {
  /// Changes the login email address of the user. The change will not be applied until the new login email address is confirmed with
  const SetLoginEmailAddress();

  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": CONSTRUCTOR,
      "@extra": extra,
    };
  }

  SetLoginEmailAddress copyWith() => const SetLoginEmailAddress();

  static const CONSTRUCTOR = 'setLoginEmailAddress';

  @override
  String getConstructor() => CONSTRUCTOR;
}
