// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, lines_longer_than_80_chars

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:t_file/app/screens/login/bloc/login_bloc.dart';
import 'package:t_file/app/screens/login/bloc/login_state.dart';
import 'package:t_file/l10n/l10n.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key, required this.isEmailLogin});
  final bool isEmailLogin;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          SizedBox(
            height: height * 0.18,
            child: const Center(
              child: FlutterLogo(size: 100),
            ),
          ),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return SizedBox(
                width: width * 0.8,
                child: Column(
                  children: [
                    Text(
                      '${l10n.your} ${isEmailLogin ? l10n.email : l10n.phoneNo}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      isEmailLogin
                          ? l10n.loginEmailAuthDesc
                          : l10n.loginPhoneAuthDesc,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 15),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              final bloc = context.read<LoginBloc>();
              if (isEmailLogin) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: bloc.loginInputField,
                    decoration: InputDecoration(
                      hintText: l10n.emailFieldHintText,
                      labelText: l10n.emailFieldLabelText,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    onChanged: (value) {
                      if (EmailValidator.validate(value)) {
                        bloc.emit(FabVisible());
                      } else {
                        bloc.emit(FabNotVisible());
                      }
                    },
                  ),
                );
              }
              return IntlPhoneField(
                autofocus: true,
                keyboardAppearance: Brightness.light,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                controller: bloc.loginInputField,
                initialCountryCode: 'IN',
                onCountryChanged: (value) => bloc.maxLength = value.maxLength,
                onChanged: (value) {
                  if (value.number.length == bloc.maxLength) {
                    bloc.emit(FabVisible());
                  } else {
                    bloc.emit(FabNotVisible());
                  }
                },
              );
            },
          ),
          const Spacer(),
        ],
      ),
      floatingActionButton: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is FabVisible) {
            return FloatingActionButton(
              onPressed: () async {},
              child: const Icon(Icons.arrow_right_alt_rounded),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
