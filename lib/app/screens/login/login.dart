import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_file/app/screens/login/bloc/login_bloc.dart';
import 'package:t_file/app/screens/login/view/login_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.isEmailLogin});
  final bool isEmailLogin;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: LoginView(
        isEmailLogin: isEmailLogin,
      ),
    );
  }
}
