import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:t_file/app/screens/login/bloc/login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(LoginInitial());
  bool isEmailLogin = true;
  final loginInputField = TextEditingController();
  String finalPhoneNumber = '';
  int maxLength = 10;
  late PhoneNumber phoneNumber;

  void setupPhoneNumberData(PhoneNumber number) {
    phoneNumber = number;
    finalPhoneNumber = number.completeNumber;
    if (loginInputField.text.length == maxLength) {
      emit(FabVisible());
    } else {
      emit(FabNotVisible());
    }
  }
}
