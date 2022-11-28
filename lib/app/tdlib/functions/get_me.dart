part of '../tdlib_api.dart';

class GetMe extends TdFunction {
  /// Returns the current user
  const GetMe();

  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": CONSTRUCTOR,
      "@extra": extra,
    };
  }

  GetMe copyWith() => const GetMe();

  static const CONSTRUCTOR = 'getMe';

  @override
  String getConstructor() => CONSTRUCTOR;
}
