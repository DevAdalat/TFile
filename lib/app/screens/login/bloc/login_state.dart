abstract class LoginState {}

class LoginFeildError extends LoginState {
  LoginFeildError({required this.errorMsg});
  final String errorMsg;
}

class LoginFeildValid extends LoginState {}

class LoginSubmitted extends LoginState {
  LoginSubmitted({required this.data});
  final String data;
}

class LoginInitial extends LoginState {}

class FabVisible extends LoginState {}

class FabNotVisible extends LoginState {}
